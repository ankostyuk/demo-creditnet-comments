$(function(){
    // Убрать ненужный DOM
    $('#nkb_widgets, #reportmenu, ul.jd_menu, div.counter').remove();
    
    // Изменить путь к ресурсам изображений
    $('img[src^="../img/"]').each(function(){
        var img = $(this);
        img.attr('src', img.attr('src').replace('../img/', 'static/demo/img/'));
    });
    
    // Изменить путь к ресурсам изображений диаграмм
    $('img[src^="../chart?chartName="]').each(function(){
        var img = $(this);
        img.attr('src', img.attr('src')
            .replace('../chart?chartName=', 'static/demo/img/chart/')
            .replace(/&[\s\S]*$/, '.png')
        );
    });
});
