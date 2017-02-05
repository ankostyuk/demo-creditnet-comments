<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Демо - поиск</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">

        <!-- Style -->
        <!-- bootstrap -->
        <link rel="stylesheet" type="text/css" href="static/css/bootstrap.css">
        <!-- НКБ -->
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/general.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/main.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/search.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/jquery.tooltip.css">
        <!-- НКБ + -->
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/cc_report_table.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/coolMultiple.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/egrul-widget.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/jquery-ui.custom.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/jquery.jdMenu.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/jquery.jgrowl.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/jquery.lightbox-0.5.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/jquery.multiselect.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/jquery.tooltip.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/jquery.treeview.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/kadmenu.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/ui.jqgrid.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/ui.multiselect.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/ui.selectmenu.css">
        <link rel="stylesheet" type="text/css" href="static/demo/nkb/css/css/uploadify.css">
        
        <!-- CommentWidget -->
        <link rel="stylesheet" type="text/css" href="static/css/message-widget/message-widget.css?20120322">
        <link rel="stylesheet" type="text/css" href="static/css/comment-widget/comment-widget.css?20120322">

        <!-- Script -->
        <script type="text/javascript" src="static/js/lib/json2.js"></script>
        <script type="text/javascript" src="static/js/lib/jquery.js"></script>
        <script type="text/javascript" src="static/js/lib/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="static/js/lib/jquery.iframe-transport.js"></script>
        <script type="text/javascript" src="static/js/lib/jquery.fileupload.js"></script>
        <script type="text/javascript" src="static/js/lib/jquery.cookie.js"></script>
        <script type="text/javascript" src="static/js/lib/underscore.js"></script>
        <script type="text/javascript" src="static/js/lib/backbone.js"></script>
        <script type="text/javascript" src="static/js/lib/date-ru-RU.js"></script>
        
        <script type="text/javascript" src="static/js/defaults.js?20120322"></script>
        <script type="text/javascript" src="static/js/dateutils.js?20120322"></script>
        <script type="text/javascript" src="static/js/message-widget.js?20120322"></script>
        <script type="text/javascript" src="static/js/comment-utils.js?20120322"></script>
        <script type="text/javascript" src="static/js/comment-widget.js?20120322"></script>
        
        <script type="text/javascript" src="static/demo/js/comment.js?20120322"></script>
        
<!-- * НКБ -->
<style type="text/css">
                   table.reportbuttons {
                       margin-top: 1mm;
                       width: 40mm;
                   }

                   table.reportbuttons td.button1 {
                       background-color: white;
                       text-align: center;
                       border-collapse: collapse;
                       text-decoration: none;
                       white-space: nowrap;
                   }

                   table.reportbuttons td.button1 a.reportbuttonlink {
                       color: black;
                       font-weight: bold;
                       border: 1px solid #537cae;
                       text-decoration: none;
                       height: 15px;
                       display: block;
                   }

                   table.reportbuttons td.button1 a.reportbuttonlink:hover {
                       color: white;
                       background-color: #537cae;
                       border: 1px solid #537cae;
                       text-decoration: none;
                   }

                   div.result_left_margin {
                       margin-left: 30px;
                   }

                   table.result_data_block td {
                       height: 15px;
                   }
               div#page_search_result dl.nav { float: left; display: block; width: 735px; height: 44px; margin: 17px 0 20px 0; padding: 0; background: #eeeeee ; -webkit-border-radius: 6px; -moz-border-radius: 6px; }
               div#page_search_result dl.nav dt {float: right; display: block; margin: 12px 20px 0 0; padding: 0; color: black; text-align: left; font-weight: bold; font-size: 14px;}
               div#page_search_result dl.nav dd { float: left; display: inline; padding: 0 3px 0 3px; height: 34px; -webkit-border-radius: 6px; -moz-border-radius: 6px; background: #dedede; }
               div#page_search_result dl.nav dd#nav1 {margin: 5px 0 0 5px; width: 210px;}
               div#page_search_result dl.nav dd#nav2 {margin: 5px 0 0 5px; width: 160px;}
               div#page_search_result dl.nav dd#nav3 {margin: 5px 0 0 5px; width: 160px;}
               div#page_search_result dl.nav dd div { padding: 9px 0 0 0; text-align: center; font-weight: bold; }
               div#page_search_result dl.nav dd span { text-decoration: none; margin-left: 0; padding: 0; text-align: center; font-weight: bold; font-size: 11px; }
               #nav3 a {text-decoration:none;}
</style>
<!-- НКБ * -->

    </head>
    
    <body>
    
        <div style="position: absolute; top: 300px; width: 100px; height: 50px; background-color: #f0f0f0;">
            <span class="creditnet-comments-hook" style="display:none;">companyShortName</span>
        </div>

<!-- * НКБ -->
<div id="page_search_result">
<dl class="nav">
<dd id="nav1"><div><span id="back_submit">Вернуться к форме поиска</span></div></dd>
<dd id="nav2">
<div><span id="top_submit">Редактор выборок</span></span></div>
<div style="position:absolute; margin-left:150px; margin-top:-40px;"><img  src="img/new_product.png" /></div>
</dd>
<dd id="nav3"></dd>
<dt>Найдено: <span></span></dt>
</dl>
</div>

<form method="get" name="fs_back" action="{THIS_PAGE}" id="back_form">
<input type="hidden" name="type" value='{TYPE}'>
<input type="hidden" name="search_type" value='{SEARCH_TYPE}'>
</form>
<table border=0 cellspacing=0 cellpadding=0>
<form name="oform" action="{THIS_PAGE}" method="post" id="oform">
<tr>
<td colspan="2">Сортировать результат поиска по</td>
</tr>
<tr>
<td id = "sort_select">
<select name="oform[order]" size=1>
<option value="asc" {ORDER_A_SEL}>по возрастанию
<option value="desc"{ORDER_D_SEL}>по убыванию
</select>&nbsp;
</td>
<td>
<input type="image" src="{PATH_TO_ROOT}img/in_searchbtn2.gif" border="0" id="oform_submit">
</td>
</tr>

<center>{NAVIGATION}</center>
<table border=0 width=100% cellspacing=0 class=result width="100%">
<!-- BEGIN comp -->
<tr><td colspan=3><img src="e.gif" alt="" width=1 height=10></td></tr>
<tr valign=top><td>
<table border=0 width="{COMPBLOCKWIDTH}" cellspacing=0 cellpadding=0 class="result_data_block">
<!--<tr><td><span class=detailed><b>{COMPNAME}</b></span></td></tr>-->
<tr><td><span class=detailed><b>{COMPNAMESHORT}</b></span></td></tr>
<tr><td><div class="result_left_margin">
<span style="font-size: 7pt;"><b>ОКПО:</b> {COMPOKPO}&nbsp;<b>ИНН:</b> {INN}&nbsp;<b>ОГРН:</b> {OGRN}

<!--BEGIN kpp --><br/><b>КПП:</b> {KPP}<!-- END kpp -->&nbsp;<b>CNN:</b> {CID}&nbsp;</span></div></td></tr>
<tr><td><div class="result_left_margin"><b>Адрес:</b> {COMPADDR}</div></td></tr>
<!-- BEGIN chief -->
<tr><td><div class="result_left_margin"><b>ФИО руководителя:</b> {CHIEFNAME}</div></td></tr>
<!-- END chief -->

<!-- BEGIN founder -->
<tr><td><div class="result_left_margin"><b>Учредитель: </b></div></td></tr><tr><td><div class="result_left_margin">{FOUNDERNAME}</div></td></tr>
<!-- END founder -->

<!-- BEGIN balances -->
<tr><td><div class="result_left_margin"><b>Отчетность:</b> <span class=detailed><span style="font-size: 7pt; font-weight: bold;">{BALANCESTR}</span></span></div></td></tr>
<!-- END balances -->
<!-- НКБ * -->

    </body>
</html>