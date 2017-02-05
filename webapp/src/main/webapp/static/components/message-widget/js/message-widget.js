/**
 * @author ankostyuk
 */

var MessageWidgetSettings = {
    templates: null,
    effects: {
        duration: 100
    }
};

/*
 * 
 * params: {
 *      container: DOM element, jQuery object
 *      position: CSS position,
 * }
 * 
 */
function MessageWidget(params){
    
    params.position = params.position || 'absolute';
    
    var _container = $(params.container);
    
    var _templates = $(MessageWidgetSettings.templates);
    var _widget = $(_templates.filter('#widget-template').html()).prependTo(_container);
    
    var _messageTypes = 'info success warning error';
    
    // Backbone
    var WidgetView = Backbone.View.extend({

        el: _widget,

        initialize: function() {
            this.$el//
                .css({
                    'position': params.position
                })//
                .hide();
            
            this.indicator = this.$el.find('.indicator')//
                .hide();
                
            this.wrapper = this.$el.find('.wrapper')//
                .hide();
            
            this.alert = this.$el.find('.alert');
            
            this.message = this.$el.find('.message');
            
            //
            this.$footers = this.$('.footer');
            this.$messageFooter = this.$('.footer.message-footer');
            this.$confirmFooter = this.$('.footer.confirm-footer');
        },
        
        events: {
            'click .confirm-no': '_doConfirmNo',
            'click .confirm-yes': '_doConfirmYes',
            'click .close-widget': 'hide'
        },
        
        _doConfirmNo: function() {
            var me = this;
            
            me.hide();
            
            if (me.confirmOptions) {
                if (_.isFunction(me.confirmOptions.no)) {
                    me.confirmOptions.no.call(this);
                }
            }
        },
        
        _doConfirmYes: function() {
            var me = this;
            
            me.hide();
            
            if (me.confirmOptions) {
                if (_.isFunction(me.confirmOptions.yes)) {
                    me.confirmOptions.yes.call(this);
                }
            }
        },
        
        showWait: function() {
            var me = this;
            me.$el.show();
            me.indicator.show();
        },
        
        showMessage: function(content, type) {
            var me = this;
            
            me.indicator.hide();
            me.message.html(content);
            me.alert.removeClass(_messageTypes).addClass(type);
            
            me.$footers.hide();
            me.$messageFooter.show();
            
            me.$el.show();
            me.wrapper.slideDown(MessageWidgetSettings.effects.duration);
        },
        
        confirm: function(content, type, options){
            var me = this;
            
            me.confirmOptions = options;
            
            me.indicator.hide();
            me.message.html(content);
            me.alert.removeClass(_messageTypes).addClass(type);
            
            me.$footers.hide();
            me.$confirmFooter.show();
            
            me.$el.show();
            me.wrapper.slideDown(MessageWidgetSettings.effects.duration);
        },
        
        hide: function(options) {
            var me = this;
            me.indicator.hide();
            me.wrapper.slideUp(MessageWidgetSettings.effects.duration, function(){
                me.message.html('');
                me.$el.fadeOut(MessageWidgetSettings.effects.duration, function(){
                    if (options && _.isFunction(options.callBack)) {
                        options.callBack.call(me);
                    }
                });
            });
        },
        
        clear: function() {
            this.indicator.hide();
            this.wrapper.hide();
            this.$el.hide();
            this.message.html('');
        },
        
        getViewEl: function() {
            return this.$el;
        }
    });

    var widget = new WidgetView();
    
    // API
    return {
        showWait: function(){
            return widget.showWait();
        },
        showMessage: function(content, type){
            return widget.showMessage(content, type);
        },
        confirm: function(content, type, options){
            return widget.confirm(content, type, options);
        },
        hide: function(options){
            return widget.hide(options);
        },
        clear: function(){
            return widget.clear();
        },
        getWidgetEl: function(){
            return widget.getViewEl();
        }
    };
};
