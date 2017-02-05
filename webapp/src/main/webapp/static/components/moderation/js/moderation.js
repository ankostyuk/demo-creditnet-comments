function Moderation(apiUrl, onErrorCallback) {

    var showError = onErrorCallback || function(){};

    var Comment = Backbone.Model.extend({
        url: function() {
            return apiUrl + '/comments/' + this.id;
        },

        set: function(key, value, options) {
            var attrs = this._attrsRef(key, value);
            //
            // API может вернуть контент с типом отличным от String, например число
            //
            if (_.has(attrs, 'content')) {
                attrs.content = '' + attrs.content;
            }
            return Backbone.Model.prototype.set.call(this, key, value, options);
        },

        _attrsRef: function(key, value) {
            var attrs;
            // Handle both `"key", value` and `{key: value}` -style arguments.
            if (_.isObject(key) || key == null) {
              attrs = key;
            } else {
              attrs = {};
              attrs[key] = value;
            }
            return attrs;
        }
    });

    var CommentList = Backbone.Collection.extend({

        model: Comment,
        url: apiUrl + '/comments/by-status.json',

        fetchMore: function(reset) {
            var me = this;

            reset = reset || false;

            var startId, startDate;
            if (me.length && !reset) {
                var last = me.at(me.length - 1);
                startId = last.get('id');
                startDate = last.get('created');
            }

            var more = new CommentList();
            more.fetch({
                data: {
                    startId: startId,
                    startDate: startDate,
                    status: (me.filterValue != 'all' ? me.filterValue.toUpperCase() : undefined)
                },
                success: function() {
                    var data = more.toJSON();
                    if (reset) {
                        me.reset(data);
                    } else {
                        me.add(data);
                    }

                    if (data.length) {
                        me.trigger('fetch.more');
                    }
                }
            });
        },

        setFilter: function(value) {
            if (this.filterValue != value) {
                this.filterValue = value
                this.fetchMore(true);
            }
        }
    });

    var CommentView = Backbone.View.extend({

        model: Comment,
        tagName: 'div',
        className: 'row comment',
        template: _.template($('#comment-template').html()),

        events: {
            'click .approve-action': 'approve',
            'click .reject-action': 'reject',
            'click .review-action': 'review',
            'click .verify-action': 'verify',
            'keydown .rejection-text input': 'rejectionKeypress',
            'click .attachment a.download': '_downloadAttachment'
        },

        initialize: function() {
            this.model.bind('change', this.onChange, this);
        },

        render: function() {
            var m = this.model.toJSON();
            this.$el.html(this.template({comment: m}));

            this.rejectionText = this.$('.rejection-text');
            this.rejectionInput = this.$('.rejection-text input');
            this.rejectionAction = this.$('.reject-action');

            return this;
        },

        onChange: function() {
            var st = this.model.get('moderation').status;
            var filter = this.options.commentList.filterValue;
            if (filter != 'all' && filter.toUpperCase() != st) {
                var me = this;
                this.$el.fadeOut('fast', function() {
                    me.remove();
                    // удалить после удаления из DOM
                    me.options.commentList.remove(me.model);
                });
            } else {
                this.render();
            }
        },

        rejectionCancel: function() {
            this.rejectionText.hide();
        },

        rejectionKeypress: function(e) {
            if (e.keyCode == 13) {
                this.reject();
            } else if(e.keyCode == 27) {
                this.rejectionCancel();
            }
        },

        approve: function() {
            this.model.partialUpdate({
                moderation: {
                    status: 'APPROVED'
                }
            });
        },

        reject: function() {
            if (this.rejectionText.is(':visible')) {
                var reason = $.trim(this.rejectionInput.val());
                if (reason) {
                    this.model.partialUpdate({
                        moderation: {
                            status: 'REJECTED',
                            rejectionReason: reason
                        }
                    });
                }
            } else {
                this.rejectionText.show();
            }
            this.rejectionInput.focus();
        },

        review: function() {
            this.model.partialUpdate({
                moderation: {
                    status: 'PENDING'
                }
            });
        },

        verify: function() {
            var verified = this.model.get('verification').verified;
            this.model.partialUpdate({
                verification: {
                    verified: !verified
                }
            });
        },

        _downloadAttachment: function(e) {
            CommentUtils.downloadFile({
                url: $(e.currentTarget).attr('href'),
                responseCallback: function(response) {
                    var s = CommentUtils.getServerErrorMessage(response);
                    var message = s ? s : CommentUtils.Messages.errorDownloadFile;
                    showError(message);
                }
            });
            return false;
        }
    });

    var CommentListView = Backbone.View.extend({

        el: $('#comment-list'),

        initialize: function() {
            this.model.bind('reset', this.reset, this);
            this.model.bind('add', this.add, this);
            this.model.bind('fetch.more', this.fetchMore, this);
            this.model.bind('remove', this.remove, this);

            this.setupScroll();
        },

        reset: function() {
            this.$el.empty();
            this.model.each(function(comment) {
                this.add(comment);
            }, this);
        },

        fetchMore: function() {
            if (this.isFullListInView()) {
                // подгрузить еще
                this.model.fetchMore();
            } else {
                // активировать бесконечную прокрутку
                this.$el.waypoint({
                    offset: 'bottom-in-view'
                });
            }
        },

        remove: function() {
            if (this.isFullListInView()) {
                // попробовать подгрузить после удаления элемента
                this.model.fetchMore();
            }
        },

        add: function(comment) {
            var view = new CommentView({
                model: comment,
                commentList: this.model
            });
            this.$el.append(view.render().$el);
        },

        setupScroll: function() {
            // бесконечная прокрутка
            var me = this;
            me.$el.waypoint(function() {
                me.$el.waypoint('remove');
                // TODO индикатор загрузки
                me.model.fetchMore();
            }, {
                offset: 'bottom-in-view'
            });
            // отключить прокрутку. Активируется при поступлении данных
            me.$el.waypoint('remove');
        },

        isFullListInView: function() {
            var height = $.waypoints('viewportHeight');
            var bottom = this.$el.position().top + this.$el.outerHeight();
            return (bottom <= height);
        }
    });

    var FilterView = Backbone.View.extend({

        el: $('#comment-filter'),
        template: _.template($('#comment-filter-template').html()),

        initialize: function() {
            this.options.commentList.bind('reset', this.render, this);
            this.render();
        },

        render: function() {
            this.$el.html(this.template({
                value: this.options.commentList.filterValue
            }));
            return this;
        }
    });

    var ModerationView = Backbone.View.extend({

        el: $('#moderation'),

        initialize: function() {
            this.commentList = new CommentList();

            new CommentListView({
                model: this.commentList
            });
            new FilterView({
                commentList: this.commentList
            });
        },

        setFilter: function(value) {
            this.commentList.setFilter(value);
        }
    });

    var Workspace = Backbone.Router.extend({

        routes: {
            'pending': 'pending',
            'approved': 'approved',
            'rejected': 'rejected',
            'all': 'all'
        },

        initialize: function(options) {
            this.app = options.application;
        },

        pending: function(query, page) {
            this.app.setFilter('pending');
        },

        approved: function(query, page) {
            this.app.setFilter('approved');
        },

        rejected: function(query, page) {
            this.app.setFilter('rejected');
        },

        all: function(query, page) {
            this.app.setFilter('all');
        }
    });

    var app = new ModerationView();
    var ws = new Workspace({
        application: app
    });

    var match = Backbone.history.start();
    if (!match) {
        ws.navigate('pending', true);
    }
}
