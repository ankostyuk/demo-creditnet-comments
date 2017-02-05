<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>[RU] ИСТОРИЧЕСКИЙ ПРОФИЛЬ &#8212; ООО "РУССКИЕ ПРОДУКТЫ ТОРГОВЫЙ КОМПЛЕКС"</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <meta name="generator" content="2.4.7">

        <!-- Script -->
        <script type="text/javascript" src="static/js/lib/json2.js?2011-10-19"></script>
        <script type="text/javascript" src="static/js/lib/jquery.js?1.7.2"></script>
        <script type="text/javascript" src="static/js/lib/jquery.ui.widget.js?1.8.17"></script>
        <script type="text/javascript" src="static/js/lib/jquery.iframe-transport.js?1.3"></script>
        <script type="text/javascript" src="static/js/lib/jquery.fileupload.js?5.6"></script>
        <script type="text/javascript" src="static/js/lib/jquery.fileDownload.js?1.3.0"></script>
        <script type="text/javascript" src="static/js/lib/jquery.cookie.js?2010"></script>
        <script type="text/javascript" src="static/js/lib/underscore.js?1.3.3"></script>
        <script type="text/javascript" src="static/js/lib/backbone.js?0.9.2"></script>
        <script type="text/javascript" src="static/js/lib/iso8601.js?2011"></script>
        <script type="text/javascript" src="static/js/lib/dateformat.js?1.2.3"></script>

        <script type="text/javascript" src="static/js/defaults.js?20120903"></script>

        <!-- Components -->
        <link  rel="stylesheet" href="static/components/bootstrap/css/bootstrap.css?1.4.0" />

        <link rel="stylesheet" href="static/components/message-widget/css/message-widget.css?20120903" />
        <script type="text/javascript" src="static/components/message-widget/js/message-widget.js?20120903"></script>

        <link rel="stylesheet" type="text/css" href="static/components/comment-widget/css/comment-widget.css?20120322">
        <script type="text/javascript" src="static/components/comment-widget/js/comment-utils.js?20120903"></script>
        <script type="text/javascript" src="static/components/comment-widget/js/comment-widget.js?20120903"></script>

        <!-- Demo -->
        <link rel="stylesheet" type="text/css" href="static/demo/css/demo.css?20120322">
        <script type="text/javascript" src="static/demo/js/report-fix.js?20120903"></script>

        <script>
            // Настройки виджетов
            MessageWidgetSettings.templates = CommentUtils.loadTemplates('static/components/message-widget/view/message-widget-templates.html');
            CommentWidgetSettings.templates = CommentUtils.loadTemplates('static/components/comment-widget/view/comment-widget-templates.html');
            CommentWidgetSettings.apiUrl = CommentUtils.API_URL;

            $(function() {
                    CommentUtils.setupButton({
                        button: '<span class="btn">К</span>',
                        callback: function(commentWidget) {
                            $('#nkbcomment-test-show-edit').click(function(e){
                                commentWidget.showAddComment();
                            });
                            $('#nkbcomment-test-hide-edit').click(function(e){
                                commentWidget.hideAddComment();
                            });
                        }
                    });

                    // TEST BlankCommentWidget
                    var blankCommentWidget = new BlankCommentWidget();
                    blankCommentWidget.show(750, 10);
                    blankCommentWidget.hide();
                    blankCommentWidget.show(750, 10);
            });
        </script>

        <!--  -->
        <style type="text/css">

            BODY {
                margin: 0;
            }
            @page {
                size: A4;
            }

            div.report {
                width: 100%;
                font-size: 8pt;
                font-family: Arial Cyr, Arial, sans-serif;
                clear: both;
            }

            div.report.header {
                width: 754px;
            }

            div.report.content {
                width: 754px;
            }
            @media print {div.report {
                    font-size: 7pt;
                    max-width: inherit;
                    font-family: Courier New, monospace;
            }
            }

            div.report div.reportswitch_1 {
                margin: 0 0 0 0;
            }

            div.report div.reportswitch_1 a {
                margin: 0 0 0 0;
            }

            div.report div.reportswitch_2 {
                margin: 0 0 0 0;
            }

            div.report div#reportmenu {
                width: 100%;
                margin: 0 2px 20px 0;
                border: 0;
            }

            div.report div#reportmenu table {
                width: 100%;
            }

            div.report div#reportmenu td {
                padding: 6px 4px 6px 6px;
                vertical-align: middle;
                background-color: #f0ede9;
                border: 0;
                white-space: nowrap;
            }

            div.report div#reportmenu td#col2 {
                width: 60px;
                text-align: left;
            }

            div.report div#reportmenu td#col3 {
                width: 65px;
                text-align: left;
            }

            div.report div#reportmenu .cssbuttons {
                margin: 0 0 0 3px;
            }

            div.report div#reportmenu .cssbuttons a {
                text-decoration: none;
                color: black;
            }

            div.report div#reportmenu .cssbuttons #descmenu1 {
                padding: 2px 20px 1px 6px;
            }

            div.report div#reportmenu .cssbuttons .topmenu {
                position: relative;
                float: left;
                padding: 2px 6px 1px;
                text-decoration: none;
                font-size: 10px;
                background-color: white;
                border: 1px solid #98012e;
                margin: 0 3px 0 5px;
                width: auto;
                height: 13px;
                color: black;
                font-weight: normal;
            }

            div.report div#reportmenu .cssbuttons .topmenuhover {
                background-color: #bb012e;
                border: 1px solid #bb012e;
            }

            div.report div#reportmenu .cssbuttons .topmenuhoverlink {
                color: white;
                font-weight: normal;
                text-decoration: none;
            }

            div.report div#reportmenu .cssbuttons #fallout {
            }

            div.report div#reportmenu .cssbuttons #fallout ul {
                position: absolute;
                border: 1px solid #bb012e;
                top: 6px;
                background-color: white;
                padding: 10px 0 10px 0;
                margin-left: 0;
                width: auto;
                left: -1px;
            }

            div.report div#reportmenu .cssbuttons #fallout ul li {
                display: block;
                border: 0;
            }

            div.report div#reportmenu .cssbuttons #fallout ul li a {
                display: block;
                padding: 3px 16px 3px;
                margin: 0;
                color: black;
                text-decoration: none;
                font-weight: normal;
                border: 0;
                white-space: nowrap;
                background-color: transparent;
            }

            div.report div#reportmenu .cssbuttons #fallout ul li a:hover {
                color: white;
                background-color: #bb012e;
            }

            div.report div#reportmenu .cssbuttons .loading {
                background: #bb012e url('../img/ajax-loader.gif') no-repeat 98% 50%;
                color: white;
                z-index: 9999;
            }

            span.visibleblock {
                display: block;
            }

            div.report .cnlogo {
                margin: 1em 0 0 14px;
            }

            div.report p.report_date_comment {
                margin: 4px 14px 1em;
                font-weight: bold;
                text-align: left;
            }

            div.report .content p.comments {
                text-align: left;
                margin: 2px 10px 0.1em;
                line-height: 100%;
                page-break-before: avoid
            }

            div.report .content p.comments_reiting {
                margin: 0 10px 0;
                text-align: left;
            }

            div.report .content p.fin_coefficient_comment {
                font-size: 80%;
                margin: 1em 10px 0;
                -fs-keep-with-inline: keep;
                page-break-before: avoid;
            }

            div.report .content p.notice_comment {
                font-size: 80%;
                margin: 1em 10px 0;
                page-break-before: avoid;
            }

            div.report .content span.bold {
                font-weight: bold;
            }

            div.report .content div.address_boss {
                margin-left: 1em;
                width: 95%;
            }

            div.report .content div.address_boss span.address_menu_float {
                float: none;
            }
            @media print {div.report .content div.address_boss span.address_menu_float {
                    float: none;
            }
            }

            div.report div.content {
                background-color: white;
                margin-top: 1em;
                min-height: 30em;
                padding: 0 4px 0 0;
            }

            div.report .content {
                padding: 0;
                margin: 4em 0 0 0;
            }
            @media print {div.report .content {
                    width: 754px;
                    -fs-keep-with-inline: keep;
                    page-break-before: auto;
                    page-break-inside: auto;
            }
            }
            @media screen {div.report .content {
                    width: 754px;
            }
            }

            div.report .content p.caption {
                padding: 2px;
                margin: 3em 2px 0 2px !important;
                margin: 3em -2px 0 2px;
                text-align: left;
                font-weight: bold;
                background: #537cae;
                font-size: 115%;
                color: white;
            }

            div.report .content p.caption span.caption_comment {
                font-size: 80%;
                margin: 0 0 0 10px;
            }

            div.report .content table.otsenka p.caption {
                padding: 2px;
                margin: 3em 2px 0 2px !important;
                margin: 3em -2px 0 2px;
                text-align: left;
                font-weight: bold;
                background: #537cae;
                font-size: 9pt;
                color: white;
            }

            div.report .content div.otsenka p.caption {
                padding: 2px;
                margin: 3em 2px 0 2px !important;
                margin: 3em 2px 0 2px;
                text-align: left;
                font-weight: bold;
                background: #537cae;
                font-size: 9pt;
                color: white;
            }

            div.report .content p.caption_top {
                padding: 2px;
                margin: 0 2px 0 2px !important;
                margin: 0 -2px 0 2px;
                text-align: left;
                font-weight: bold;
                background: #537cae;
                font-size: 115%;
                color: white;
            }

            div.report .content p.caption_without_indent {
                padding: 2px;
                margin: 1em 2px 0 2px !important;
                margin: 1em -2px 0 2px;
                text-align: left;
                font-weight: bold;
                background: #537cae;
                font-size: 115%;
                color: white;
            }
            @media print {div.report .content p.caption {
                    width: 687px;
                    page-break-inside: avoid;
                    page-break-after: avoid;
            }
            }

            div.report table {
                border-collapse: collapse;
                border: 0;
                width: 100%;
                vertical-align: top;
            }
            @media print {div.report table {
                    border-collapse: collapse;
                    orphans: 2;
                    widows: 2;
                    page-break-before: avoid;
                    page-break-after: inherit;
            }
            }

            div.report tr {
                page-break-inside: avoid;
            }

            div.report th {
                border: 2px solid white;
                vertical-align: top;
                font-weight: bold;
                text-align: center;
                background: #abcbf1;
                color: #333333;
            }
            @media print {div.report th {
                    page-break-inside: avoid;
            }
            }

            div.report div.zagolovok {
                text-align: left;
                width: 500px;
                page-break-after: avoid;
                margin: 60px 0 15px 200px;
            }

            div.report div.zagolovok_compact {
                text-align: left;
                width: 500px;
                page-break-after: avoid;
                margin: 0 0 15px 250px;
            }

            div.report div.zagolovok div.reportname {
                color: #5c5c5c;
                vertical-align: top;
                font-style: oblique;
                font-weight: bold;
                font-size: 17px;
                margin: 0 0 6px;
            }

            div.report div.zagolovok div.bsnname {
                color: #143b6b;
                vertical-align: top;
                font-weight: bold;
                font-size: 20px;
                margin: 0 0 50px 50px;
                width: 350px;
            }

            div.report div.zagolovok_compact div.bsnname {
                color: #143b6b;
                vertical-align: top;
                font-weight: bold;
                font-size: 20px;
                margin: 0 0 1em 1em;
                width: 400px;
            }

            div.report h3 {
                margin: 3em 1em -2em;
                page-break-inside: avoid;
                page-break-after: avoid;
                font-size: 9pt;
                clear: both;
            }

            div.report h4 {
                margin: 3em 1em -2em;
                page-break-inside: avoid;
                page-break-after: avoid;
                font-size: 8pt;
                clear: both;
            }

            div.report h4.comments {
                margin: 3em 1em 1em;
                page-break-inside: avoid;
                page-break-after: avoid;
                font-size: 8pt;
                clear: both;
            }
            @media print {div.report div.header {
                    padding: 0;
                    width: 687px;
            }
            }
            @media screen {div.report div.header {
                    padding: 0;
                    width: 756px;
            }
            }

            div.report td {
                border: 2px solid white;
                vertical-align: top;
            }

            div.report .content td.bold {
                font-weight: bold;
            }

            div.report .content div.internalblock table.salevolumedynamics_block {
                border: 0;
                width: 100%;
            }
            @media print {div.report .content div.internalblock table.salevolumedynamics_block {
                    width: 687px;
            }
            }

            div.report .content div.internalblock table.salevolumedynamics_block tr {
                border: 0;
            }

            div.report .content div.internalblock table.salevolumedynamics_block td {
                padding: 1px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.salevolumedynamics_block .col1 {
                font-weight: bold;
                text-align: left;
                width: 60px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.salevolumedynamics_block .col2 {
                text-align: right;
                width: 100px;
                border-width: 2px 0 0 2px;
                white-space: nowrap;
            }

            div.report .content div.internalblock table.salevolumedynamics_block .col3 {
                text-align: right;
                width: 30px;
                border-width: 2px 0 0 2px;
                vertical-align: bottom;
            }

            div.report .content div.internalblock table.block_simple {
                width: 100%;
                border: 0;
                margin: 3em 0 0 0;
            }

            div.report .content div.internalblock table.block_simple td {
                background-color: white;
                text-align: left;
            }

            div.report .content div.internalblock table.block_reiting {
                width: 90mm;
                border: 0;
            }

            div.report .content div.internalblock table.block_reiting td {
                background-color: #F4F1EC;
            }

            div.report .content div.internalblock {
                border-top-width: 0;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 0;
                border-color: white;
                border-style: solid;
                margin: 0 1px 1px 2px;
                padding: 0;
                font-size: 8pt;
            }

            div.report .content div.otsenka div.internalblock {
                margin: 0 2px 1px 2px;
                width: 367px !important;
                width: 368px;
            }
            @media print {div.report .content div.internalblock {
                    width: 687px;
            }
            }
            @media print {div.report .content div.otsenka div.internalblock {
                    width: 687px;
            }
            }

            div.report .content div.internalblock tr {
                font-size: 8pt;
            }

            div.report .content div.internalblock td {
                background-color: #f4f1ec;
            }

            div.report .content div.internalblock th {
            }

            div.report .content div.internalblock table.block {
                border: 0;
                width: 100%;
            }

            div.report .content div.internalblock table.block tr {
                border: 0;
            }

            div.report .content div.internalblock table.block td {
                padding: 1px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.block .col1 {
                font-weight: bold;
                text-align: left;
                width: 160px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .col2 {
                text-align: left; /*width: 150mm;*/
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .col1_rating {
                text-align: left;
                width: 100px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .col2_rating {
                text-align: left;
                width: 100px;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .col3_rating {
                text-align: left; /*width: 150mm;*/
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .gos_reg_col1 {
                text-align: left;
                font-weight: bold;
                width: 156px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .gos_reg_col2 {
                text-align: left;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceChangesInCapital_col1 {
                font-weight: bold;
                text-align: left;
                width: 450px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .repBalanceChangesInCapital_col2 {
                text-align: right;
                width: 139px;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceChangesInCapital_col3 {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceCashFlows_col1 {
                font-weight: bold;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .repBalanceCashFlows_col2 {
                text-align: right;
                width: 139px;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceBalanceSheetAppendix_col1 {
                font-weight: bold;
                width: 370px;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .repBalanceBalanceSheetAppendix_col2 {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceBalanceSheetAppendix_col3 {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceResearchDevelopmentEngineering_col1 {
                font-weight: bold;
                width: 370px;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .repBalanceResearchDevelopmentEngineering_col2 {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceResearchDevelopmentEngineering_col3 {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceNaturalResourcesDevelopment_col1 {
                font-weight: bold;
                width: 370px;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .repBalanceNaturalResourcesDevelopment_col2 {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceFinancialInvestments_col1 {
                font-weight: bold;
                width: 370px;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .repBalanceFinancialInvestments_col2 {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.block .repBalanceOrdinaryOperationsExpenses_col1 {
                font-weight: bold;
                width: 370px;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .repBalanceOrdinaryOperationsExpenses_col2 {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.findata .balanceDinamics_highlighting {
                color: #B00E0E;
            }

            div.report .content div.internalblock table.block .balanceDinamics_col1 {
                font-weight: bold;
                width: 370px;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .balanceDinamics_col2 {
                text-align: right;
                width: 90px;
                border-width: 2px 0 0 2px;
            }

            div.report div.content div.internalblock table.block_reiting td.col1 {
                font-weight: bold;
                text-align: left;
                width: 30mm;
            }

            div.report div.content div.internalblock table.block_reiting td.col2 {
                text-align: right;
            }

            div.historname {
                text-align: right;
                font-style: italic;
            }

            div.report .content div.internalblock td.actual {
                font-weight: bold;
            }

            div.report .content div.internalblock span.actual_sign {
                vertical-align: bottom;
            }

            div.report .content div.internalblock span.cross_sign {
                vertical-align: bottom;
            }

            div.report .footnote {
                vertical-align: super;
                font-weight: bold;
                font-size: 80%;
            }

            div.report .footnote_comment {
                font-weight: bold;
                font-size: 80%;
            }

            div.report .content div.internalblock table.findata {
                border: 0;
                width: 100%;
            }

            div.report .content div.internalblock table.findata tr {
                border: 0;
            }

            div.report .content div.internalblock table.findata tr.odd {
                background-color: #dddad5;
            }

            div.report .content div.internalblock table.findata th {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.findata td {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.findata .column1 {
                width: 224px;
                font-weight: normal;
                padding: 1px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.findata .column2 {
                text-align: center;
                padding: 1px;
                width: 26px;
                font-weight: bold;
            }

            div.report .content div.internalblock table.findata .column3 {
                text-align: right;
                padding: 1px;
                width: 485px;
            }

            div.report .content div.internalblock table.findata .column3_main_balance {
                text-align: right;
                padding: 1px;
            }

            div.report .content div.internalblock table.findata .column3_2datacols {
                text-align: right;
                padding: 1px;
                width: 240px;
            }

            div.report .content div.internalblock table.findata .column3_4datacols {
                text-align: right;
                padding: 1px;
                width: 118px;
            }

            div.report .content div.internalblock table.findata_indikator {
                border: 0;
                width: 100%;
            }

            div.report .content div.internalblock table.findata_indikator tr {
                border: 0;
            }

            div.report .content div.internalblock table.findata_indikator th {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.findata_indikator td {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.findata_indikator .column1 {
                width: 60mm;
                font-weight: bold;
                padding: 1px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.findata_indikator .column1_1 {
                width: 7mm;
                font-weight: bold;
                padding: 1px;
                text-align: right;
            }

            div.report .content div.internalblock table.findata_indikator .column2 {
                text-align: right;
                padding: 1px;
            }

            div.report .content div.internalblock table.findata_indikator .column3 {
                text-align: right;
                padding: 1px;
                width: 18mm;
                font-weight: bold;
            }

            div.report .content div.internalblock table.findata_indikator .column4 {
                text-align: right;
                padding: 1px;
                width: 25mm;
            }
            @media print {
            }

            div.report .content div.otsenka {
                width: 754px;
            }
            @media print {div.report .content div.otsenka {
                    width: 687px;
            }
            }

            div.report .content div.otsenka_left {
                float: left;
                width: 371px;
            }
            @media print {div.report .content div.otsenka_left {
                    float: left;
                    width: 687px;
            }
            }

            div.report .content div.otsenka_right {
                float: right;
                width: 371px;
            }
            @media print {div.report .content div.otsenka_right {
                    float: right;
                    width: 687px;
            }
            }

            div.report .content div.otsenka_bottom {
                clear: both;
            }
            @media print {div.report div.otsenka {
                    width: 688px;
                    margin-top: 1em;
                    border: 0;
                    padding: 0;
                    border-spacing: 0;
                    background-color: white;
            }
            }
            @media screen {div.report .content table.otsenka {
                    width: 100%;
                    margin: 0;
                    border: 0;
                    padding: 0;
            }
            }

            div.report .content table.otsenka tr {
                border: 0;
                background-color: white;
            }

            div.report .content table.otsenka td {
                border: 0;
                vertical-align: top;
                padding: 0;
            }

            div.report .content table.otsenka td.otsenka_col1 {
                vertical-align: top;
                padding: 0 0 0 0 !important;
                padding: 0 4pt 0 0;
            }

            div.report .content table.otsenka td.otsenka_col2 {
                vertical-align: top;
                padding: 0 0 0 12px !important;
                padding: 0 4pt 0 12px;
            }
            @media print {div.report div.internalblock div.block_otsenka {
                    border: 1px solid #537cae;
                    padding: 0;
                    background-color: #f4f1ec;
            }
            }
            @media screen {div.report div.internalblock div.block_otsenka {
                    border: 1px solid #537cae;
                    padding: 0;
                    background-color: #f4f1ec;
            }
            }
            @media print {div.report .content div.internalblock table.block_potentsial {
                    width: 100%;
                    margin: 0 1px 2px;
            }
            }
            @media screen {div.report .content div.internalblock table.block_potentsial {
                    border: 0;
                    width: 100%;
            }
            }

            div.report .content div.internalblock table.block_potentsial tr {
                border: 0;
            }

            div.report .content div.internalblock table.block_potentsial th {
                border-width: 2px 0 0 2px;
                border-style: solid;
                border-color: white;
            }

            div.report .content div.internalblock table.block_potentsial td {
                text-align: center;
                border-width: 2px 0 0 2px;
                border-style: solid;
                border-color: white;
                background-color: #F4F1EC;
            }

            div.report .content div.internalblock table.block_potentsial .col1 {
                border-width: 2px 0 0 0;
            }

            div.report div.otsenka_border {
                border: 0;
            }

            div.report span.videlenie_otsenki {
                font-weight: bold;
                color: red;
            }

            div.report div.otsenka_block {
                margin: 2px 2px 0 4px;
                line-height: 1.5;
                background-color: #F4F1EC;
            }

            div.report .content div.internalblock tr.separator {
                border: 0;
                height: 2px;
            }

            div.report .content div.internalblock tr.separator td {
                border-width: 2px 0 0 0;
                border-color: white;
                border-style: solid;
                padding: 0;
                margin: 0;
                height: 2px;
            }

            div.report .content div.internalblock tr.separator div.separator_block {
                height: 2px;
                background: #537cae;
                font-size: 1px;
            }

            div.report .content div.internalblock tr.separator div.separator_big_block {
                height: 3px;
                background: #537cae;
                font-size: 1px;
            }

            div.report .content div.internalblock table.founderdepender_block tr.separator_part_sort td {
                border-width: 2px 0 0 0;
                border-color: white;
                border-style: solid;
                padding: 0;
                margin: 0;
                height: 10px;
            }

            div.report .content div.internalblock table.founderdepender_block tr.separator_part_sort div.separator_block {
                height: 11px;
                background: #537cae;
                font-size: 80%;
                color: white;
                padding: 1px;
            }

            div.report .content div.internalblock table.founderdepender_block {
                border-width: 0;
                width: 100%;
            }

            div.report .content div.internalblock table.founderdepender_block th {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.founderdepender_block tr {
                border: 0;
            }

            div.report .content div.internalblock table.founderdepender_block td {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.founderdepender_block tr.separator td {
                border-width: 2px 0 0 0;
                border-color: white;
                border-style: solid;
                padding: 0;
                margin: 0;
            }

            div.report .content div.internalblock table.founderdepender_block td.branchcol1 {
                border-width: 2px 0 0 0;
                width: 60px;
                text-align: left;
            }

            div.report .content div.internalblock table.founderdepender_block td.branchcol2 {
                width: 65px;
                text-align: left;
                white-space: nowrap;
            }
            @media print {div.report .content div.internalblock table.founderdepender_block td.branchcol2 {
                    width: 85px;
            }
            }

            div.report .content div.internalblock table.founderdepender_block td.branchcol3 {
                width: 80px;
                text-align: right;
            }

            div.report .content div.internalblock table.founderdepender_block td.branchcol4 {
                width: 40px;
                text-align: right;
            }

            div.report .content div.internalblock table.founderdepender_block td.branchcol5 {
                /*width: 346px;*/
                width: 57%;
                text-align: left;
            }

            div.report .content div.internalblock table.founderdepender_block td.branchcol_capital {
                width: 80px;
                text-align: right;
            }

            div.report .content div.internalblock table.founderdepender_block th.branch_coefficient {
                font-size: 80%;
            }

            div.report .content div.internalblock table.dolgnost_block {
                border: 0;
                width: 100%;
            }

            div.report .content div.internalblock table.dolgnost_block th {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.dolgnost_block tr {
                border: 0;
            }

            div.report .content div.internalblock table.dolgnost_block tr.separator td {
                border-width: 2px 0 0 0;
                border-color: white;
                border-style: solid;
                padding: 0;
                margin: 0;
            }

            div.report .content div.internalblock table.dolgnost_block td {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.dolgnost_block td.dolgnostcol1 {
                width: 70px;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.dolgnost_block td.dolgnostcol2 {
                width: 70px;
                text-align: left;
            }
            @media print {div.report .content div.internalblock table.dolgnost_block td.dolgnostcol2 {
                    width: 85px;
            }
            }

            div.report .content div.internalblock table.dolgnost_block td.dolgnostcol3 {
                width: 90px;
                text-align: left;
                white-space: nowrap;
            }

            div.report .content div.internalblock table.dolgnost_block td.dolgnostcol4 {
            }

            div.report .content div.internalblock table.internalhistory {
                border: 0;
                width: 100%;
                margin: 0;
                font-size: 8pt;
                page-break-before: avoid;
            }

            div.report .content div.internalblock table.internalhistory tr {
                border: 0;
            }

            div.report .content div.internalblock table.internalhistory th {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.internalhistory th.name {
                font-weight: bold;
                text-align: left;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.internalhistory td {
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.internalhistory .ihcol1 {
                width: 160px;
                border-width: 2px 0 0 0;
                text-align: left;
                color: black;
                font-weight: bold;
                background-color: #F4F1EC;
            }

            div.report .content div.internalblock table.internalhistory .ihcol2 {
                width: 60px;
                text-align: left;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.internalhistory .ihcol3 {
                width: 70px;
                text-align: left;
                border-width: 2px 0 0 2px;
            }
            @media print {div.report .content div.internalblock table.internalhistory .ihcol3 {
                    width: 85px;
            }
            }

            div.report .content div.internalblock table.internalhistory .ihcol4 {
                text-align: left;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.internalhistory .ihcol4_num {
                text-align: right;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.internalhistory .ihcol5 {
                text-align: left;
                border-width: 2px 0 0 2px;
            }

            /* div.report button.btn {
                font: bold 84% 'trebuchet ms', helvetica, sans-serif;
                background-color: #537cae;
                color: white;
                margin: 4px 10px 0;
            } */

            div.report .content div.internalblock table.timeline_block tr.separator_interval td {
                border-width: 2px 0 0 0;
                border-color: white;
                border-style: solid;
                padding: 1px;
                margin: 0;
                height: 16px;
                background: #537cae;
                font-weight: bold;
                color: white;
            }

            div.report .content div.internalblock table.timeline_block tr.separator_interval div.separator_block {
            }

            div.report .content div.internalblock table.timeline_block {
                border-width: 0;
                width: 100%;
            }

            div.report .content div.internalblock table.timeline_block th {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.timeline_block tr {
                border: 0;
            }

            div.report .content div.internalblock table.timeline_block td {
                border-width: 2px 0 0 2px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.timeline_block tr.separator td {
                border-width: 2px 0 0 0;
                border-color: white;
                border-style: solid;
                padding: 0;
                margin: 0;
            }

            div.report .content div.internalblock table.timeline_block td.branchcol1 {
                border-width: 2px 0 0 0;
                width: 60px;
                text-align: left;
            }

            div.report .content div.internalblock table.timeline_block td.branchcol2 {
                width: 65px;
                text-align: left;
                white-space: nowrap;
            }
            @media print {div.report .content div.internalblock table.timeline_block td.branchcol2 {
                    width: 85px;
            }
            }

            div.report .content div.internalblock table.timeline_block td.branchcol3 {
                border-width: 2px 0 0 0;
                width: 80px;
                text-align: right;
                white-space: nowrap;
            }

            div.report .content div.internalblock table.timeline_block td.branchcol4 {
                width: 40px;
                text-align: right;
            }

            div.report .content div.internalblock table.timeline_block td.branchcol5 {
                text-align: left;
            }

            div.report .content div.internalblock table.timeline_block td.branchcol_capital {
                width: 80px;
                text-align: right;
            }

            div.report .content div.internalblock table.timeline_block th.branch_coefficient {
                font-size: 80%;
            }

            div.report .content div.internalblock table.timeline_block tr.questionable_data {
                background-color: #ffcee7;
            }

            div.report .content div.internalblock table.okvedactivities_block {
                border: 0;
                width: 100%;
            }

            div.report .content div.internalblock table.okvedactivities_block tr {
                border: 0;
            }

            div.report .content div.internalblock table.okvedactivities_block td {
                padding: 1px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.okvedactivities_block .col1 {
                font-weight: bold;
                text-align: left;
                width: 150px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.okvedactivities_block .col2 {
                text-align: left;
                width: 40px;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.okvedactivities_block .col3 {
                text-align: left;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.altmanzscore_block {
                border: 0;
                width: 100%;
            }

            div.report .content div.internalblock table.altmanzscore_block tr {
                border: 0;
            }

            div.report .content div.internalblock table.altmanzscore_block td {
                padding: 1px;
                border-color: white;
                border-style: solid;
            }

            div.report .content div.internalblock table.altmanzscore_block .col1 {
                font-weight: bold;
                text-align: left;
                width: 60px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.altmanzscore_block .col2 {
                text-align: right;
                font-weight: bold;
                width: 60px;
                border-width: 2px 0 0 2px;
            }

            div.report .content div.internalblock table.altmanzscore_block .col3 {
                text-align: left;
                border-width: 2px 0 0 2px;
            }

            div.report span.bold {
                font-weight: bold;
            }

            div.report .content div.chartblock {
                margin: 1em 0 0 2px;
            }

            div.creditreforma {
                font-family: Monospace;
            }

            div.creditreforma span.emphasis {
                color: red;
            }

            div.report .content div.internalblock table.block .reliable_col1 {
                text-align: left;
                font-weight: bold;
                width: 156px;
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block .reliable_col2 {
                text-align: left;
                border-width: 2px 0 0 2px;
            }

            div.report div.reliable_alert {
                text-align: right;
                font-weight: bold;
                margin: 0 1em 0 0;
            }

            div.report .content div.internalblock table.block_notes_badge td.col1 {
                width: 20px;
                text-align: center;
            }

            div.report .content p.demo_alert {
                margin: 0 1em 1em 1em;
                background-color: #fff7c4;
                padding: 1em;
            }

            div.report .kadmenu {
                position: relative;
                top: 3px;
                border: 0;
            }

            ul.jd_menu {
                display: inline;
            }

            ul.jd_menu li.knopajka {
                display: inline;
                padding: 0 0 0 2px;
                border: 0;
            }
            @media print {ul.jd_menu {
                    display: none;
            }

            .kadmenu {display:none;
            }
            }

            .no_wrap {
                white-space: nowrap;
            }

            div.report .content div.internalblock table.block td.egrulfound1 {
                border-width: 2px 0 0 0;
                width: 74px;
                text-align: right;
                white-space: nowrap;
            }

            div.report .content div.internalblock table.block td.egrulfound2 {
                width: 84px;
                text-align: right;
                white-space: nowrap;
            }

            div.report .content div.internalblock table.block td.egrulfound3 {
                width: 60px;
                text-align: right;
                white-space: nowrap;
            }

            div.report .content div.internalblock table.block td.egrulfound4 {
                border-width: 2px 0 0 0;
            }

            div.report .content div.internalblock table.block td.egrulfound5 {
                width: 84px;
                text-align: left;
            }

            #egrul_inn_data {
                display: none;
            }

            #egrul_ogrn_data {
                display: none;
            }

            #egrul_bsn_data {
                display: none;
            }

        </style>
        <!--[if IE]>
            <style type="text/css">
            div.report div#reportmenu .cssbuttons #fallout ul {
            top: 15px;
            }
            ul.jd_menu li.knopajka {
            padding: 0 0 0 6px;
            }
            </style>
        <![endif]-->
        <script type="text/javascript">
            <!--
            $(document).ready(function(){

                $(".cssbuttons #descmenu1").hover(function(){
                    if ($(".cssbuttons #descmenu1").find('ul').length == 0) {
                        ajaxMenu();
                        $(".cssbuttons #descmenu1").find('#fallout').ajaxSuccess(function(evt, request, settings){
                            $(".cssbuttons #descmenu1 #fallout").show();
                            $(".cssbuttons #descmenu1 #fallout").find('ul').stop(true, true);
                            $(".cssbuttons #descmenu1 #fallout").find('ul').slideDown(50);
                        });
                    }
                    else {
                        $(".cssbuttons #descmenu1 #fallout").show();
                        $(".cssbuttons #descmenu1 #fallout").find('ul').stop(true, true);
                        $(".cssbuttons #descmenu1 #fallout").find('ul').slideDown(50);
                    }
                }, function(){
                    $(".cssbuttons #descmenu1").find('#fallout').stop(true, true);
                    $(".cssbuttons #descmenu1").find('#fallout').slideUp(50);
                    $(".cssbuttons #descmenu1").find('#fallout').hide();
                });
            });
            function ajaxMenu(){
                $.ajax({
                    url: '../search/ajax/index.php?id=1623941',
                    contentType: "text/html;charset=utf-8",
                    beforeSend: function(){
                        $(".cssbuttons #descmenu1").addClass('loading');
                    },
                    success: function(data){
                        $(".cssbuttons #descmenu1 #fallout").append(data);
                        //alert("1");
                        $(".cssbuttons #descmenu1").removeClass('loading');
                    },
                    error: function(xhr, ajaxOptions, thrownError){
                        //alert(thrownError);
                        $(".cssbuttons #descmenu1 #fallout").append(thrownError);
                        $(".cssbuttons #descmenu1").removeClass('loading');
                    }
                });
            }

            $(document).ready(function(){

                $(".cssbuttons .topmenu").hover(function(){
                    $(this).addClass('topmenuhover');
                    $(this).find("a").addClass('topmenuhoverlink');
                }, function(){
                    $(this).removeClass('topmenuhover');
                    $(this).find("a").removeClass('topmenuhoverlink');
                });
            });
            function kadpopup(searchData){
                window.open('../search/ajax/kad.php?search=' + searchData, '', 'width=820,height=640,location=no,toolbar=no,scrollbars=yes,menubar=no,status=no,directories=no');
            }

            //-->
        </script>
    </head>
    <!--top--><!--cnblk03 top-->
    <body>
        <div id="nkbcomment-test-toolbar">
            <span id="nkbcomment-test-show-edit" class="btn">Показать виджет редактирования</span>
            <span id="nkbcomment-test-hide-edit" class="btn">Скрыть виджет редактирования</span>
        </div>
        <div id="nkb_widgets">
            <div id="ogrn_data">
                1045005511187
            </div>
            <div id="inn_data">
                5029077559
            </div>
            <div id="bsn_data">
                1623941
            </div>
            <div id="company_name_data">
                ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ &quot;РУССКИЕ ПРОДУКТЫ ТОРГОВЫЙ КОМПЛЕКС&quot;
            </div>
        </div>
        <div class="report">
            <!--menu--><!--menu-->
            <div id="reportmenu">
                <table>
                    <tr>
                        <td id="col1">
                            <div class="cssbuttons">
                                <div id="descmenu1" class="topmenu">
                                    <span id="fallout"></span>
                                    <a href="../search/?a=s&amp;form[id]=1623941&amp;type=adv" target="_blank" id="menu1">Другие профили</a>
                                </div>
                                <div id="descmenu2" class="topmenu">
                                    <a href="../search/offlinea/?id=1623941" target="_blank">Актуализировать</a>
                                </div>
                                <div id="descmenu3" class="topmenu">
                                    <a href="../search/offlinee/?id=1623941" target="_blank">Заказать выписку из ЕГРЮЛ</a>
                                </div>
                                <div id="descmenu4" class="topmenu">
                                    <a href="javascript:void(0)" onclick="kadpopup('%D0%9E%D0%91%D0%A9%D0%95%D0%A1%D0%A2%D0%92%D0%9E%20%D0%A1%20%D0%9E%D0%93%D0%A0%D0%90%D0%9D%D0%98%D0%A7%D0%95%D0%9D%D0%9D%D0%9E%D0%99%20%D0%9E%D0%A2%D0%92%D0%95%D0%A2%D0%A1%D0%A2%D0%92%D0%95%D0%9D%D0%9D%D0%9E%D0%A1%D0%A2%D0%AC%D0%AE%20%22%D0%A0%D0%A3%D0%A1%D0%A1%D0%9A%D0%98%D0%95%20%D0%9F%D0%A0%D0%9E%D0%94%D0%A3%D0%9A%D0%A2%D0%AB%20%D0%A2%D0%9E%D0%A0%D0%93%D0%9E%D0%92%D0%AB%D0%99%20%D0%9A%D0%9E%D0%9C%D0%9F%D0%9B%D0%95%D0%9A%D0%A1%22');">Иски и судебные решения</a>
                                </div>
                                <div id="descmenu5" class="topmenu">
                                    <a target="_blank" href="../search/ajax/kommersant.php?action=view&inn=5029077559&ogrn=1045005511187" target="_blank">Объявления о несостоятельности</a>
                                </div>
                            </div>
                        </td>
                        <td id="col2">
                            <div class="reportswitch_1">
                                <a href="http://www.creditnet.ru/reports/?code=rep_history_profile&amp;example=true&amp;id=1623941&amp;format=doc&amp;report_id=610036"><img src='../img/word_16.gif' border="0" alt="doc"></a><a href="http://www.creditnet.ru/reports/?code=rep_history_profile&amp;example=true&amp;id=1623941&amp;format=xls&amp;report_id=610036"><img src='../img/excel_16.gif' border="0" alt="xls"></a><a href="http://www.creditnet.ru/reports/?code=rep_history_profile&amp;example=true&amp;id=1623941&amp;format=pdf&amp;report_id=610036"><img src='../img/pdf_18.png' border="0" alt="pdf"></a>
                            </div>
                        </td>
                        <td id="col3">
                            <div class="reportswitch_2">
                                <a href="http://www.creditnet.ru/reports/?code=rep_history_profile&amp;example=true&amp;id=1623941&amp;lang=ru&amp;report_id=610036"><img src='../img/flag_russia.png' border="0" alt="ru"></a><a href="http://www.creditnet.ru/reports/?code=rep_history_profile&amp;example=true&amp;id=1623941&amp;lang=en&amp;report_id=610036"><img src='../img/flag_great_britain.png' border="0" alt="en"></a><a href="http://www.creditnet.ru/reports/?code=rep_history_profile&amp;example=true&amp;id=1623941&amp;lang=de&amp;report_id=610036"><img src='../img/flag_germany.png' border="0" alt="de"></a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="header">
                <a href="/"><img src='../img/nkb_logo_ru.png' class="cnlogo" alt="" border="0"></a>
                <div>
                    <div class="zagolovok">
                        <div class="reportname">
                            ИСТОРИЧЕСКИЙ ПРОФИЛЬ
                        </div>
                        <div class="bsnname">
                            ООО "РУССКИЕ ПРОДУКТЫ ТОРГОВЫЙ КОМПЛЕКС"
                        </div>
                    </div>
                    <p class="report_date_comment">
                        Дата генерации отчета: 25.11.2011.
                        № 610036.
                        CNN: 1623941.
                    </p>
                </div>
            </div>
            <div class="content">
                <!--general info--><!--cnblk04 generalInfo-->
                <p class="caption_top">
                    Общие сведения
                </p>
                <div class="internalblock">
                    <table class="internalhistory">
                        <tr>
                            <th class="ihcol1" rowspan="2">
                                Краткое наименование
                            </th>
                            <th class="ihcol2">
                                на
                            </th>
                            <th class="ihcol3">
                                актуально
                            </th>
                            <th class="ihcol4">
                            </th>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2005
                            </td>
                            <td class="ihcol3">
                                01.10.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="ihcol4">
                                ООО "РУССКИЕ ПРОДУКТЫ ТОРГОВЫЙ КОМПЛЕКС"<span>
                                    <ul class="jd_menu">
                                        <li class="knopajka">
                                            <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                            <span class="ajax_search_string">1623941</span>
                                            <span class="ajax_search_type">id_comp</span>
                                            <span class="ajax_search_lang">ru</span>
                                            <span class="ajax_search_inn"></span>
                                            <span class="show_only_reports">0</span>
                                            <span class="transliterate">1</span>
                                            <ul>
                                            </ul>
                                        </li>
                                    </ul>
                                </span>
                                <span class="creditnet-comments-hook"
                                      data-post-id="companyShortName"
                                      data-title="ООО &quot;РУССКИЕ ПРОДУКТЫ ТОРГОВЫЙ КОМПЛЕКС&quot;"
                                      ></span>
                            </td>
                        </tr>
                    </table>
                    <table class="internalhistory">
                        <tr>
                            <th class="ihcol1" rowspan="2">
                                Полное наименование
                            </th>
                            <th class="ihcol2">
                                на
                            </th>
                            <th class="ihcol3">
                                актуально
                            </th>
                            <th class="ihcol4">
                            </th>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2005
                            </td>
                            <td class="ihcol3">
                                01.10.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="ihcol4">
                                ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "РУССКИЕ ПРОДУКТЫ ТОРГОВЫЙ КОМПЛЕКС"
                                <%-- Комментарии без title --%>
                                <span class="creditnet-comments-hook"
                                      data-post-id="companyFullName"
                                      ></span>
                            </td>
                        </tr>
                    </table>
                    <table class="block">
                        <tr>
                            <td class="col1">
                                Состояние:
                            </td>
                            <td class="col2">
                                Действующее
                                по данным ФНС на 09.09.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                Дата образования:
                            </td>
                            <td class="col2">
                                15.07.2004
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                Дата последней актуализации:
                            </td>
                            <td class="col2">
                                01.10.2011
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                ОГРН:
                            </td>
                            <td class="col2">
                                1045005511187
                                от 15.07.2004
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                ИНН:
                            </td>
                            <td class="col2">
                                5029077559
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                ОКПО:
                            </td>
                            <td class="col2">
                                73051413
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                КПП:
                            </td>
                            <td class="col2">
                                502901001
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                ОКФС:
                            </td>
                            <td class="col2">
                            (34)&nbsp;
                            Совместная частная и иностранная собственность
                        </tr>
                        <tr>
                            <td class="col1">
                                ОКОПФ:
                            </td>
                            <td class="col2">
                                (65)&nbsp;
                                Общества с ограниченной ответственностью
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                ОКАТО:
                            </td>
                            <td class="col2">
                                Московская область,
                                Мытищинский район,
                                Мытищи
                                (46234501000)
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                Вид деятельности основной
                            </td>
                            <td class="col2">
                                45.21 Производство общестроительных работ
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                Вид деятельности из баланса
                            </td>
                            <td class="col2">
                                70.20 Сдача внаем собственного недвижимого имущества
                            </td>
                        </tr>
                    </table>
                    <table class="internalhistory">
                        <tr>
                            <th class="ihcol1" rowspan="2">
                                Уставный капитал
                            </th>
                            <th class="ihcol2">
                                на
                            </th>
                            <th class="ihcol3">
                                актуально
                            </th>
                            <th class="ihcol4">
                                Руб.
                            </th>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2005
                            </td>
                            <td class="ihcol3">
                                01.10.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="ihcol4_num">
                                10 000,00
                            </td>
                        </tr>
                    </table>
                    <table class="internalhistory">
                        <tr>
                            <th class="ihcol1" rowspan="3">
                                Руководитель
                            </th>
                            <th class="ihcol2">
                                на
                            </th>
                            <th class="ihcol3">
                                актуально
                            </th>
                            <th class="ihcol4">
                                Должность
                            </th>
                            <th class="ihcol5">
                            </th>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                26.06.2009
                            </td>
                            <td class="ihcol3">
                                01.10.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="ihcol4">
                                ГЕНЕРАЛЬНЫЙ ДИРЕКТОР
                            </td>
                            <td class="ihcol5">
                                ЖЕРМЕН ЖАН-ПЬЕР<span>
                                    <ul class="jd_menu">
                                        <li class="knopajka">
                                            <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                            <span class="ajax_search_string">ЖЕРМЕН ЖАН-ПЬЕР</span>
                                            <span class="ajax_search_type">chief_name</span>
                                            <span class="ajax_search_lang">ru</span>
                                            <span class="ajax_search_inn"></span>
                                            <span class="show_only_reports">0</span>
                                            <span class="dont_repeat_bsnid">1623941</span>
                                            <span class="transliterate">1</span>
                                            <ul>
                                            </ul>
                                        </li>
                                    </ul>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2005
                            </td>
                            <td class="ihcol3">
                                25.06.2009
                            </td>
                            <td class="ihcol4">
                                ГЕНЕРАЛЬНЫЙ ДИРЕКТОР
                            </td>
                            <td class="ihcol5">
                                МАРШАДУР ВАЛЕРИ<span>
                                    <ul class="jd_menu">
                                        <li class="knopajka">
                                            <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                            <span class="ajax_search_string">МАРШАДУР ВАЛЕРИ</span>
                                            <span class="ajax_search_type">chief_name</span>
                                            <span class="ajax_search_lang">ru</span>
                                            <span class="ajax_search_inn"></span>
                                            <span class="show_only_reports">0</span>
                                            <span class="dont_repeat_bsnid">1623941</span>
                                            <span class="transliterate">1</span>
                                            <ul>
                                            </ul>
                                        </li>
                                    </ul>
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk56 Egrul management private--><!--cnblk56 Egrul management private-->
                <p class="caption">
                    Управляющие компании по данным ФНС РФ (ЕГРЮЛ) от 09.09.2011
                </p>
                <div class="internalblock">
                    <table class="block">
                        <tr>
                            <th style="border-width: 2px 0 0 0;">
                                Дата ГРН
                            </th>
                            <th>
                                ГРН
                            </th>
                            <th style="border-width: 2px 0 0 0;">
                            </th>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                05.06.2009
                            </td>
                            <td class="egrulfound2">
                                2095029056263
                            </td>
                            <td class="egrulfound4" style="border-width: 2px 0 0 0;">
                                <span class="bold">Общество с ограниченной ответственностью "АШАН"</span>
                                (Представитель управляющей компании: <span class="bold">Жермен,Жан-Пьер,</span>)
                                <div class="address_boss">
                                    <span class="address_menu_float">141014,Область Московская, ,Город Мытищи, ,Шоссе Осташковское,1,,</span>
                                    <span>
                                        <ul class="jd_menu">
                                            <li class="knopajka">
                                                <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                <span class="ajax_search_string">141014,Область Московская, ,Город Мытищи, ,Шоссе Осташковское,1,,</span>
                                                <span class="ajax_search_type">addrvirt</span>
                                                <span class="ajax_search_lang">ru</span>
                                                <span class="ajax_search_inn"></span>
                                                <span class="show_only_reports">0</span>
                                                <span class="dont_repeat_bsnid">1623941</span>
                                                <span class="transliterate">1</span>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </span>
                                </div>
                                <div class="address_boss">
                                </div>
                                <span class="no_wrap">КПП: 502901001</span>
                                <span class="no_wrap">ИНН: <span class="bold">7703270067</span></span>
                                <span>
                                    <ul class="jd_menu">
                                        <li class="knopajka">
                                            <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                            <span class="ajax_search_string">7703270067</span>
                                            <span class="ajax_search_type">inn</span>
                                            <span class="ajax_search_lang">ru</span>
                                            <span class="ajax_search_inn"></span>
                                            <span class="show_only_reports">0</span>
                                            <span class="transliterate">1</span>
                                            <ul>
                                            </ul>
                                        </li>
                                    </ul>
                                </span>
                                <span class="no_wrap">ОГРН: <span class="bold">1027739329408</span></span>
                                <span>
                                    <ul class="jd_menu">
                                        <li class="knopajka">
                                            <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                            <span class="ajax_search_string">1027739329408</span>
                                            <span class="ajax_search_type">ogrn</span>
                                            <span class="ajax_search_lang">ru</span>
                                            <span class="ajax_search_inn"></span>
                                            <span class="show_only_reports">0</span>
                                            <span class="transliterate">1</span>
                                            <ul>
                                            </ul>
                                        </li>
                                    </ul>
                                </span>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--contacts--><!--cnblk01 contacts-->
                <p class="caption">
                    Контактная информация
                </p>
                <div class="internalblock">
                    <table class="internalhistory">
                        <tr>
                            <th class="ihcol1" rowspan="5">
                                Юридический адрес
                            </th>
                            <th class="ihcol2">
                                на
                            </th>
                            <th class="ihcol3">
                                актуально
                            </th>
                            <th class="ihcol4">
                            </th>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2008
                            </td>
                            <td class="ihcol3">
                                01.10.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="ihcol4">
                                <span style="float:left;">141009, МОСКОВСКАЯ ОБЛАСТЬ, Г МЫТИЩИ, МКАД, ТПЗ "АЛТУФЬЕВО", Д 3, КОРП 1<span>
                                        <ul class="jd_menu">
                                            <li class="knopajka">
                                                <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                <span class="ajax_search_string">141009, МОСКОВСКАЯ ОБЛАСТЬ, Г МЫТИЩИ, МКАД, ТПЗ "АЛТУФЬЕВО", Д 3, КОРП 1</span>
                                                <span class="ajax_search_type">addrvirt</span>
                                                <span class="ajax_search_lang">ru</span>
                                                <span class="ajax_search_inn"></span>
                                                <span class="show_only_reports">0</span>
                                                <span class="dont_repeat_bsnid">1623941</span>
                                                <span class="transliterate">1</span>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </span></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2007
                            </td>
                            <td class="ihcol3">
                                31.08.2008
                            </td>
                            <td class="ihcol4">
                                <span style="float:left;">141009, МОСКОВСКАЯ ОБЛ.,Г МЫТИЩИ,МКАД, ТПЗ "АЛТУФЬЕВО", Д 3, КОРП 1<span>
                                        <ul class="jd_menu">
                                            <li class="knopajka">
                                                <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                <span class="ajax_search_string">141009, МОСКОВСКАЯ ОБЛ.,Г МЫТИЩИ,МКАД, ТПЗ "АЛТУФЬЕВО", Д 3, КОРП 1</span>
                                                <span class="ajax_search_type">addrvirt</span>
                                                <span class="ajax_search_lang">ru</span>
                                                <span class="ajax_search_inn"></span>
                                                <span class="show_only_reports">0</span>
                                                <span class="dont_repeat_bsnid">1623941</span>
                                                <span class="transliterate">1</span>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </span></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                28.05.2007
                            </td>
                            <td class="ihcol3">
                                31.08.2007
                            </td>
                            <td class="ihcol4">
                                <span style="float:left;">141009, МОСКОВСКАЯ ОБЛАСТЬ, Г МЫТИЩИ, МКАД, ТПЗ "АЛТУФЬЕВО", Д 3, КОРП 1<span>
                                        <ul class="jd_menu">
                                            <li class="knopajka">
                                                <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                <span class="ajax_search_string">141009, МОСКОВСКАЯ ОБЛАСТЬ, Г МЫТИЩИ, МКАД, ТПЗ "АЛТУФЬЕВО", Д 3, КОРП 1</span>
                                                <span class="ajax_search_type">addrvirt</span>
                                                <span class="ajax_search_lang">ru</span>
                                                <span class="ajax_search_inn"></span>
                                                <span class="show_only_reports">0</span>
                                                <span class="dont_repeat_bsnid">1623941</span>
                                                <span class="transliterate">1</span>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </span></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2005
                            </td>
                            <td class="ihcol3">
                                27.05.2007
                            </td>
                            <td class="ihcol4">
                                <span style="float:left;">141009, МОСКОВСКАЯ ОБЛ.,Г МЫТИЩИ,УЛ ТИТОВА, Д 7, КОРП 6<span>
                                        <ul class="jd_menu">
                                            <li class="knopajka">
                                                <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                <span class="ajax_search_string">141009, МОСКОВСКАЯ ОБЛ.,Г МЫТИЩИ,УЛ ТИТОВА, Д 7, КОРП 6</span>
                                                <span class="ajax_search_type">addrvirt</span>
                                                <span class="ajax_search_lang">ru</span>
                                                <span class="ajax_search_inn"></span>
                                                <span class="show_only_reports">0</span>
                                                <span class="dont_repeat_bsnid">1623941</span>
                                                <span class="transliterate">1</span>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </span></span>
                            </td>
                        </tr>
                    </table>
                    <table class="internalhistory">
                        <tr>
                            <th class="ihcol1" rowspan="3">
                                Фактический адрес
                            </th>
                            <th class="ihcol2">
                                на
                            </th>
                            <th class="ihcol3">
                                актуально
                            </th>
                            <th class="ihcol4">
                            </th>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2007
                            </td>
                            <td class="ihcol3">
                                01.09.2007<span class='cross_sign'><img src='../img/question.png' alt=''></span>
                            </td>
                            <td class="ihcol4">
                                <span style="float:left;">141009, МОСКОВСКАЯ ОБЛ.,Г МЫТИЩИ,МКАД, ТПЗ "АЛТУФЬЕВО", Д 3, КОРП 1<span>
                                        <ul class="jd_menu">
                                            <li class="knopajka">
                                                <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                <span class="ajax_search_string">141009, МОСКОВСКАЯ ОБЛ.,Г МЫТИЩИ,МКАД, ТПЗ "АЛТУФЬЕВО", Д 3, КОРП 1</span>
                                                <span class="ajax_search_type">addrvirt</span>
                                                <span class="ajax_search_lang">ru</span>
                                                <span class="ajax_search_inn"></span>
                                                <span class="show_only_reports">0</span>
                                                <span class="dont_repeat_bsnid">1623941</span>
                                                <span class="transliterate">1</span>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </span></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="ihcol2">
                                01.09.2005
                            </td>
                            <td class="ihcol3">
                                31.08.2007
                            </td>
                            <td class="ihcol4">
                                <span style="float:left;">141009, МОСКОВСКАЯ ОБЛ.,Г МЫТИЩИ,УЛ ТИТОВА, Д 7, КОРП 6<span>
                                        <ul class="jd_menu">
                                            <li class="knopajka">
                                                <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                <span class="ajax_search_string">141009, МОСКОВСКАЯ ОБЛ.,Г МЫТИЩИ,УЛ ТИТОВА, Д 7, КОРП 6</span>
                                                <span class="ajax_search_type">addrvirt</span>
                                                <span class="ajax_search_lang">ru</span>
                                                <span class="ajax_search_inn"></span>
                                                <span class="show_only_reports">0</span>
                                                <span class="dont_repeat_bsnid">1623941</span>
                                                <span class="transliterate">1</span>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </span></span>
                            </td>
                        </tr>
                    </table>
                    <table class="block">
                        <tr>
                            <td class="col1">
                                Телефон при регистрации:
                            </td>
                            <td class="col2">
                                721-20-90
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk08 risk rating-->
                <div class="otsenka_border">
                    <p class="caption">
                        Оценка риска на 2011 год
                    </p>
                    <div class="otsenka_block">
                        <span class="col1">Оценка финансового потенциала:</span>
                        <span class="videlenie_otsenki">5A</span>
                        <br>
                        <span class="col1">Индикатор финансового риска:</span>
                        <span class="videlenie_otsenki">1</span>
                        <br>
                        <span class="col1">Рекомендации:</span>
                        <span class="videlenie_otsenki">Продолжать сделку и предоставлять значительные льготы. </span>
                        <br>
                        <span class="col1">Рекомендуемая сумма кредита:</span>
                        <span class="videlenie_otsenki">440 889,85 тыс. руб.</span>
                    </div>
                </div>
                <p class="caption_without_indent">
                    Динамика финансового потенциала
                </p>
                <div class="internalblock">
                    <table class="block_potentsial">
                        <tbody>
                            <tr>
                                <th class="col1">
                                    01.01.2006
                                </th>
                                <th class="col2">
                                    01.01.2007
                                </th>
                                <th class="col2">
                                    01.01.2008
                                </th>
                                <th class="col2">
                                    01.01.2009
                                </th>
                                <th class="col2">
                                    01.01.2010
                                </th>
                                <th class="col2">
                                    01.01.2011
                                </th>
                            </tr>
                            <tr>
                                <td class="col1">
                                    N (N &#8212; отрицательное значение собственного капитала) 4
                                </td>
                                <td class="col2">
                                    1A 4
                                </td>
                                <td class="col2">
                                    5A 4
                                </td>
                                <td class="col2">
                                    5A 4
                                </td>
                                <td class="col2">
                                    5A 1
                                </td>
                                <td class="col2">
                                    5A 1
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--cnblk49 trends and charts-->
                <div class="otsenka">
                    <div class="otsenka_left">
                        <!--cnblk10 rating sale volume dynamics-->
                        <p class="caption">
                            Динамика объема продаж
                        </p>
                        <div class="internalblock">
                            <table class="salevolumedynamics_block">
                                <tbody>
                                    <tr>
                                        <th class="col1">
                                            год
                                        </th>
                                        <th class="col2">
                                            x1000 руб.
                                        </th>
                                        <th class="col3">
                                            %
                                        </th>
                                        <th class="col3">
                                        </th>
                                        <th class="col2">
                                            тренд
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2005
                                        </td>
                                        <td class="col2">
                                            -
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col2">
                                            -
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2006
                                        </td>
                                        <td class="col2">
                                            10 421,00
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col2">
                                            -
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2007
                                        </td>
                                        <td class="col2">
                                            376 101,00
                                        </td>
                                        <td class="col3">
                                            3 509,07
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            365 680,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2008
                                        </td>
                                        <td class="col2">
                                            1 172 918,00
                                        </td>
                                        <td class="col3">
                                            211,86
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            796 817,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2009
                                        </td>
                                        <td class="col2">
                                            385 035,00
                                        </td>
                                        <td class="col3">
                                            67,17
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_down.png" alt="">
                                        </td>
                                        <td class="col2">
                                            -787 883,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2010
                                        </td>
                                        <td class="col2">
                                            377 801,00
                                        </td>
                                        <td class="col3">
                                            1,88
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_down.png" alt="">
                                        </td>
                                        <td class="col2">
                                            -7 234,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2011
                                        </td>
                                        <td class="col2">
                                            388 048,00
                                        </td>
                                        <td class="col3">
                                            2,71
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            10 247,00
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="chartblock">
                            <img src="../chart?chartName=salesChart&amp;reportId=610036&amp;lang=ru" alt="img"/>
                            <span class="creditnet-comments-hook"
                                  data-post-id="salesChart"
                                  data-title="ООО &quot;РУССКИЕ ПРОДУКТЫ ТОРГОВЫЙ КОМПЛЕКС&quot; - Динамика объема продаж"
                                  ></span>
                        </div>
                    </div>
                    <div class="otsenka_right">
                        <!-- cnblk11 rating profit loss-->
                        <p class="caption">
                            Прибыль/убыток до налогообложения
                        </p>
                        <div class="internalblock">
                            <table class="salevolumedynamics_block">
                                <tbody>
                                    <tr>
                                        <th class="col1">
                                            год
                                        </th>
                                        <th class="col2">
                                            x1000 руб.
                                        </th>
                                        <th class="col3">
                                            %
                                        </th>
                                        <th class="col3">
                                        </th>
                                        <th class="col2">
                                            тренд
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2005
                                        </td>
                                        <td class="col2">
                                            -15 601,00
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col2">
                                            -
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2006
                                        </td>
                                        <td class="col2">
                                            -11 742,00
                                        </td>
                                        <td class="col3">
                                            24,74
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            3 859,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2007
                                        </td>
                                        <td class="col2">
                                            141 571,00
                                        </td>
                                        <td class="col3">
                                            1 305,68
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            153 313,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2008
                                        </td>
                                        <td class="col2">
                                            424 459,00
                                        </td>
                                        <td class="col3">
                                            199,82
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            282 888,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2009
                                        </td>
                                        <td class="col2">
                                            314 873,00
                                        </td>
                                        <td class="col3">
                                            25,82
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_down.png" alt="">
                                        </td>
                                        <td class="col2">
                                            -109 586,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2010
                                        </td>
                                        <td class="col2">
                                            113 294,00
                                        </td>
                                        <td class="col3">
                                            64,02
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_down.png" alt="">
                                        </td>
                                        <td class="col2">
                                            -201 579,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2011
                                        </td>
                                        <td class="col2">
                                            152 304,00
                                        </td>
                                        <td class="col3">
                                            34,43
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            39 010,00
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="chartblock">
                            <img src="../chart?chartName=profitChart&amp;reportId=610036&amp;lang=ru" alt="img"/>
                        </div>
                    </div>
                    <div class="otsenka_bottom">
                    </div>
                </div>
                <div class="otsenka">
                    <div class="otsenka_left">
                        <!--cnblk12 rating net worth-->
                        <p class="caption">
                            Собственный капитал
                        </p>
                        <div class="internalblock">
                            <table class="salevolumedynamics_block">
                                <tbody>
                                    <tr>
                                        <th class="col1">
                                            год
                                        </th>
                                        <th class="col2">
                                            x1000 руб.
                                        </th>
                                        <th class="col3">
                                            %
                                        </th>
                                        <th class="col3">
                                        </th>
                                        <th class="col2">
                                            тренд
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2005
                                        </td>
                                        <td class="col2">
                                            -15 591,00
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col2">
                                            -
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2006
                                        </td>
                                        <td class="col2">
                                            -27 333,00
                                        </td>
                                        <td class="col3">
                                            75,31
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_down.png" alt="">
                                        </td>
                                        <td class="col2">
                                            -11 742,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2007
                                        </td>
                                        <td class="col2">
                                            114 238,00
                                        </td>
                                        <td class="col3">
                                            517,95
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            141 571,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2008
                                        </td>
                                        <td class="col2">
                                            451 111,00
                                        </td>
                                        <td class="col3">
                                            294,89
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            336 873,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2009
                                        </td>
                                        <td class="col2">
                                            686 968,00
                                        </td>
                                        <td class="col3">
                                            52,28
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            235 857,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2010
                                        </td>
                                        <td class="col2">
                                            1 648 956,00
                                        </td>
                                        <td class="col3">
                                            140,03
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            961 988,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2011
                                        </td>
                                        <td class="col2">
                                            1 770 756,00
                                        </td>
                                        <td class="col3">
                                            7,39
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            121 800,00
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="chartblock">
                            <img src="../chart?chartName=standCapitalChart&amp;reportId=610036&amp;lang=ru" alt="img"/>
                        </div>
                    </div>
                    <div class="otsenka_right">
                        <!--cnblk13 rating work capital-->
                        <p class="caption">
                            Чистый оборотный капитал (ЧОК)
                        </p>
                        <div class="internalblock">
                            <table class="salevolumedynamics_block">
                                <tbody>
                                    <tr>
                                        <th class="col1">
                                            год
                                        </th>
                                        <th class="col2">
                                            x1000 руб.
                                        </th>
                                        <th class="col3">
                                            %
                                        </th>
                                        <th class="col3">
                                        </th>
                                        <th class="col2">
                                            тренд
                                        </th>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2005
                                        </td>
                                        <td class="col2">
                                            -211 065,00
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col3">
                                            -
                                        </td>
                                        <td class="col2">
                                            -
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2006
                                        </td>
                                        <td class="col2">
                                            -2 035 705,00
                                        </td>
                                        <td class="col3">
                                            864,49
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_down.png" alt="">
                                        </td>
                                        <td class="col2">
                                            -1 824 640,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2007
                                        </td>
                                        <td class="col2">
                                            -1 899 497,00
                                        </td>
                                        <td class="col3">
                                            6,69
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            136 208,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2008
                                        </td>
                                        <td class="col2">
                                            -256 806,00
                                        </td>
                                        <td class="col3">
                                            86,48
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            1 642 691,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2009
                                        </td>
                                        <td class="col2">
                                            -600 045,00
                                        </td>
                                        <td class="col3">
                                            133,66
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_down.png" alt="">
                                        </td>
                                        <td class="col2">
                                            -343 239,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2010
                                        </td>
                                        <td class="col2">
                                            427 805,00
                                        </td>
                                        <td class="col3">
                                            171,30
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            1 027 850,00
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">
                                            01.01.2011
                                        </td>
                                        <td class="col2">
                                            593 781,00
                                        </td>
                                        <td class="col3">
                                            38,80
                                        </td>
                                        <td class="col3">
                                            <img src="../img/strelka_trend_up.png" alt="">
                                        </td>
                                        <td class="col2">
                                            165 976,00
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="chartblock">
                            <img src="../chart?chartName=currentAssetsAndTermLiabilitiesChart&amp;reportId=610036&amp;lang=ru" alt="img"/>
                        </div>
                    </div>
                    <div class="otsenka_bottom">
                    </div>
                </div>
                <!--governmentRegistrationBlock--><!--cnblkb05 governmentRegistrationBlock-->
                <p class="caption">
                    Данные государственной регистрации
                </p>
                <div class="internalblock">
                    <table class="block">
                        <!-- 01.09.2005 - 01.10.2011 -->
                        <tr>
                            <td class="gos_reg_col1">
                                Регистрирующий орган
                            </td>
                            <td class="gos_reg_col2">
                                ИНСПЕКЦИЯ МНС РОССИИ ПО Г МЫТИЩИ МОСКОВСКОЙ ОБЛАСТИ
                            </td>
                        </tr>
                        <tr>
                            <td class="gos_reg_col1">
                                Дата регистрации
                            </td>
                            <td class="gos_reg_col2">
                                15.07.2004
                            </td>
                        </tr>
                        <tr>
                            <td class="gos_reg_col1">
                                Регистрационный номер
                            </td>
                            <td class="gos_reg_col2">
                                1045005511187
                            </td>
                        </tr>
                        <tr>
                            <td class="gos_reg_col1">
                                Тип
                            </td>
                            <td class="gos_reg_col2">
                                Государственная регистрация первичная (ОГРН)
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="2">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <!-- 26.06.2009 - 01.10.2011 -->
                        <tr>
                            <td class="gos_reg_col1">
                                Регистрирующий орган
                            </td>
                            <td class="gos_reg_col2">
                                ИФНС РОССИИ ПО Г МЫТИЩИ МОСКОВСКОЙ ОБЛАСТИ
                            </td>
                        </tr>
                        <tr>
                            <td class="gos_reg_col1">
                                Дата регистрации
                            </td>
                            <td class="gos_reg_col2">
                                19.12.2006
                            </td>
                        </tr>
                        <tr>
                            <td class="gos_reg_col1">
                                Регистрационный номер
                            </td>
                            <td class="gos_reg_col2">
                                2065029224291
                            </td>
                        </tr>
                        <tr>
                            <td class="gos_reg_col1">
                                Тип
                            </td>
                            <td class="gos_reg_col2">
                                Государственная регистрация изменений (ГРН)
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="2">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                Сведения об образовании
                            </td>
                            <td class="col2">
                                Государственная регистрация юридического лица при создании
                                на
                                15.07.2004
                                (ОГРН 1045005511187, дата выписки 09.09.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>)<a href="http://www.creditnet.ru/reports/?code=rep_history_profile&example=true&id=1623941#origin_anchor" class="footnote">3</a>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="2">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk54 Egrul comp successors and predecessors--><!--cnblk52 Egrul comp registration--><!--cnblk37 okved activities-->
                <p class="caption">
                    Деятельность по ОКВЭД
                </p>
                <div class="internalblock">
                    <table class="okvedactivities_block">
                        <tr>
                            <td rowspan="1" class="col1">
                                Основные виды деятельности
                            </td>
                            <td class="col2">
                                45.21
                            </td>
                            <td class="col3">
                                Производство общестроительных работ
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="1" class="col1">
                                Виды деятельности из баланса
                            </td>
                            <td class="col2">
                                70.20
                            </td>
                            <td class="col3">
                                Сдача внаем собственного недвижимого имущества
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="1" class="col1">
                                Дополнительные виды деятельности
                            </td>
                            <td class="col2">
                                74.20
                            </td>
                            <td class="col3">
                                Деятельность в области архитектуры; инженерно-техническое проектирование; геолого-разведочные и геофизические работы; геодезическая и картографическая деятельность; деятельность в области стандартизации и метрологии; деятельность в области гидрометеорологии и смежных с ней областях, мониторинга состояния окружающей среды, ее загрязнения; виды деятельности, связанные с решением технических задач, не включенные в другие группировки
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <p class="comments">
                    Если не указана сноска, то источник информации &#8212; Росстат
                </p>
                <!--cnblk22 Основные финансовые индикаторы diagnostics fin data indicator-->
                <p class="caption">
                    Основные финансовые индикаторы
                </p>
                <div class="internalblock">
                    <table class="findata_indikator">
                        <tr>
                            <th class="column1">
                                &nbsp;
                            </th>
                            <th class="column1_1">
                                &nbsp;
                            </th>
                            <th class="column2">
                                01.01.2006
                            </th>
                            <th class="column2">
                                01.01.2007
                            </th>
                            <th class="column2">
                                01.01.2008
                            </th>
                            <th class="column2">
                                01.01.2009
                            </th>
                            <th class="column2">
                                01.01.2010
                            </th>
                            <th class="column2">
                                01.01.2011
                            </th>
                            <th class="column3">
                                оптимум
                            </th>
                        </tr>
                        <tr>
                            <td class="column1">
                                Коэффициент текущей ликвидности
                            </td>
                            <td class="column1_1">
                                x
                            </td>
                            <td class="column2">
                                0,16
                            </td>
                            <td class="column2">
                                0,19
                            </td>
                            <td class="column2">
                                0,67
                            </td>
                            <td class="column2">
                                0,43
                            </td>
                            <td class="column2">
                                6,16
                            </td>
                            <td class="column2">
                                6,70
                            </td>
                            <td class="column3">
                                1,5-2,5
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Коэффициент платежеспособности (автономии)
                            </td>
                            <td class="column1_1">
                                x
                            </td>
                            <td class="column2">
                                -0,01
                            </td>
                            <td class="column2">
                                0,05
                            </td>
                            <td class="column2">
                                0,22
                            </td>
                            <td class="column2">
                                0,40
                            </td>
                            <td class="column2">
                                0,94
                            </td>
                            <td class="column2">
                                0,93
                            </td>
                            <td class="column3">
                                0,5-0,55
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Коэффициент покрытия основных средств
                            </td>
                            <td class="column1_1">
                                x
                            </td>
                            <td class="column2">
                                -7,06
                            </td>
                            <td class="column2">
                                17,33
                            </td>
                            <td class="column2">
                                3,41
                            </td>
                            <td class="column2">
                                0,00
                            </td>
                            <td class="column2">
                                0,00
                            </td>
                            <td class="column2">
                                0,00
                            </td>
                            <td class="column3">
                                0,75-1
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Коэффициент задолженности
                            </td>
                            <td class="column1_1">
                                x
                            </td>
                            <td class="column2">
                                -88,70
                            </td>
                            <td class="column2">
                                20,52
                            </td>
                            <td class="column2">
                                3,58
                            </td>
                            <td class="column2">
                                1,53
                            </td>
                            <td class="column2">
                                0,07
                            </td>
                            <td class="column2">
                                0,08
                            </td>
                            <td class="column3">
                                0,8-1
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Оборачиваемость кредиторской задолженности
                            </td>
                            <td class="column1_1">
                                дн.
                            </td>
                            <td class="column2">
                                31 866,14
                            </td>
                            <td class="column2">
                                809,50
                            </td>
                            <td class="column2">
                                242,92
                            </td>
                            <td class="column2">
                                140,70
                            </td>
                            <td class="column2">
                                80,13
                            </td>
                            <td class="column2">
                                97,96
                            </td>
                            <td class="column3">
                                &lt;=30
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Оборачиваемость дебиторской задолженности
                            </td>
                            <td class="column1_1">
                                дн.
                            </td>
                            <td class="column2">
                                1 051,01
                            </td>
                            <td class="column2">
                                334,85
                            </td>
                            <td class="column2">
                                162,67
                            </td>
                            <td class="column2">
                                416,78
                            </td>
                            <td class="column2">
                                352,69
                            </td>
                            <td class="column2">
                                364,34
                            </td>
                            <td class="column3">
                                &lt;=60
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Длительность финансового цикла
                            </td>
                            <td class="column1_1">
                                дн.
                            </td>
                            <td class="column2">
                                -30 815,13
                            </td>
                            <td class="column2">
                                -474,65
                            </td>
                            <td class="column2">
                                -80,25
                            </td>
                            <td class="column2">
                                276,44
                            </td>
                            <td class="column2">
                                272,57
                            </td>
                            <td class="column2">
                                266,39
                            </td>
                            <td class="column3">
                                &lt;=80
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Рентабельность основной деятельности
                            </td>
                            <td class="column1_1">
                                %
                            </td>
                            <td class="column2">
                                169,54
                            </td>
                            <td class="column2">
                                126,14
                            </td>
                            <td class="column2">
                                90,66
                            </td>
                            <td class="column2">
                                55,80
                            </td>
                            <td class="column2">
                                53,75
                            </td>
                            <td class="column2">
                                49,95
                            </td>
                            <td class="column3">
                                &gt;=30
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Рентабельность продаж (ROS)
                            </td>
                            <td class="column1_1">
                                %
                            </td>
                            <td class="column2">
                                -112,68
                            </td>
                            <td class="column2">
                                37,64
                            </td>
                            <td class="column2">
                                28,66
                            </td>
                            <td class="column2">
                                61,26
                            </td>
                            <td class="column2">
                                14,81
                            </td>
                            <td class="column2">
                                31,39
                            </td>
                            <td class="column3">
                                &gt;=5
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Рентабельность активов (ROA)
                            </td>
                            <td class="column1_1">
                                %
                            </td>
                            <td class="column2">
                                -0,49
                            </td>
                            <td class="column2">
                                5,76
                            </td>
                            <td class="column2">
                                16,25
                            </td>
                            <td class="column2">
                                13,58
                            </td>
                            <td class="column2">
                                3,17
                            </td>
                            <td class="column2">
                                6,40
                            </td>
                            <td class="column3">
                                &gt;=5
                            </td>
                        </tr>
                        <tr>
                            <td class="column1">
                                Рентабельность собственного капитала (ROE)
                            </td>
                            <td class="column1_1">
                                %
                            </td>
                            <td class="column2">
                                42,96
                            </td>
                            <td class="column2">
                                123,93
                            </td>
                            <td class="column2">
                                74,52
                            </td>
                            <td class="column2">
                                34,33
                            </td>
                            <td class="column2">
                                3,39
                            </td>
                            <td class="column2">
                                6,88
                            </td>
                            <td class="column3">
                                &gt;=5
                            </td>
                        </tr>
                    </table>
                </div>
                <p class="comments">
                    Коэффициент текущей ликвидности &#8212; отношение оборотных активов к краткосрочным обязательствам.
                </p>
                <p class="comments">
                    Коэффициент платежеспособности (автономии) &#8212; доля собственного капитала в суммарных активах.
                </p>
                <p class="comments">
                    Коэффициент покрытия основных средств &#8212; отношение основных средств к собственному капиталу.
                </p>
                <p class="comments">
                    Коэффициент задолженности &#8212; отношение заемных средств к собственному капиталу.
                </p>
                <p class="comments">
                    Оборачиваемость кредиторской задолженности &#8212; период погашения кредиторской задолженности.
                </p>
                <p class="comments">
                    Оборачиваемость дебиторской задолженности &#8212; период погашения дебиторской задолженности.
                </p>
                <p class="comments">
                    Длительность финансового цикла &#8212; Период между оплатой средств поставщикам и поступлением средств от покупателей.
                </p>
                <p class="comments">
                    Рентабельность основной деятельности &#8212; показывает долю прибыли приходящуюся на рубль затрат от реализации.
                </p>
                <p class="comments">
                    Рентабельность продаж (ROS) &#8212; показывает долю прибыли в каждом заработанном рубле.
                </p>
                <p class="comments">
                    Рентабельность активов (ROA) &#8212; Показывает способность активов компании порождать прибыль.
                </p>
                <p class="comments">
                    Рентабельность собственного капитала ( ROE) &#8212; показывает долю прибыли на каждый инвестированный рубль.
                </p>
                <!--cnblk23 Баланс 1--><h3>БАЛАНС</h3>
                <p class="caption">
                    АКТИВЫ
                </p>
                <div class="internalblock">
                    <table class="findata">
                        <tr>
                            <th class="column1" valign="top">
                                &nbsp;
                            </th>
                            <th class="column2" valign="top">
                                Код
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2006
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2007
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2008
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2009
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2010
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2011
                                <br>
                            </th>
                        </tr>
                        <tr class="bold">
                            <td class="column1" valign="top">
                                <span class="bold">I. ВНЕОБОРОТНЫЕ АКТИВЫ</span>
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Нематериальные активы
                            </td>
                            <td class="column2" valign="top">
                                110
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Основные средства
                            </td>
                            <td class="column2" valign="top">
                                120
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                193 091,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 979 346,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 539 370,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Незавершенное строительство
                            </td>
                            <td class="column2" valign="top">
                                130
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 815 281,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                34 389,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                4 877,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                38 923,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                32 872,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                57 117,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Доходные вложения в материальные ценности
                            </td>
                            <td class="column2" valign="top">
                                135
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 248 090,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 219 723,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 149 491,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Долгосрочные финансовые вложения
                            </td>
                            <td class="column2" valign="top">
                                140
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Отложенные налоговые активы
                            </td>
                            <td class="column2" valign="top">
                                145
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Прочие внеоборотные активы
                            </td>
                            <td class="column2" valign="top">
                                150
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                <span class='bold'>ИТОГО ПО РАЗДЕЛУ I.</span>
                            </td>
                            <td class="column2" valign="top">
                                <span class='bold'>190</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 008 372,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 013 735,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 544 247,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 287 013,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 252 595,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 206 608,00</span>
                            </td>
                        </tr>
                        <tr class="bold">
                            <td class="column1" valign="top">
                                &nbsp;
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="bold" style="page-break-before:auto;">
                            <td class="column1" valign="top">
                                <span class="bold">II. ОБОРОТНЫЕ АКТИВЫ</span>
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Запасы
                            </td>
                            <td class="column2" valign="top">
                                210
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                3,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                385,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                8,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                8,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                в том числе: сырье, материалы и другие аналогичные ценности
                            </td>
                            <td class="column2" valign="top">
                                211
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Животные на выращивании и откормке
                            </td>
                            <td class="column2" valign="top">
                                212
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Затраты в незавершенном производстве
                            </td>
                            <td class="column2" valign="top">
                                213
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Готовая продукция и товары для перепродажи
                            </td>
                            <td class="column2" valign="top">
                                214
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Товары отгруженные
                            </td>
                            <td class="column2" valign="top">
                                215
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Расходы будущих периодов
                            </td>
                            <td class="column2" valign="top">
                                216
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                3,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                385,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                8,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                8,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Прочие запасы и затраты
                            </td>
                            <td class="column2" valign="top">
                                217
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Налог на добавленную стоимость по приобретенным ценностям
                            </td>
                            <td class="column2" valign="top">
                                220
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                358 466,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                99 192,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                5,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                7 085,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                621,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Дебиторская задолженность (платежи по которой ожидаются более чем через 12 мес.)
                            </td>
                            <td class="column2" valign="top">
                                230
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                в том числе: Покупатели и заказчики
                            </td>
                            <td class="column2" valign="top">
                                231
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Дебиторская задолженность (платежи по которой ожидаются в течение 12 мес.)
                            </td>
                            <td class="column2" valign="top">
                                240
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                30 007,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                345 035,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                522 721,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                439 655,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                365 056,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                387 343,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                в том числе: Покупатели и заказчики
                            </td>
                            <td class="column2" valign="top">
                                241
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                49 771,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                117 816,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                67 278,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                29 233,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                44 017,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Краткосрочные финансовые вложения
                            </td>
                            <td class="column2" valign="top">
                                250
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                142 200,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                301 350,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Денежные средства
                            </td>
                            <td class="column2" valign="top">
                                260
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                139,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                36,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 077,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                2 284,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                2 859,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                9 224,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Прочие оборотные активы
                            </td>
                            <td class="column2" valign="top">
                                270
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                <span class='bold'>ИТОГО ПО РАЗДЕЛУ II.</span>
                            </td>
                            <td class="column2" valign="top">
                                <span class='bold'>290</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>388 612,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>444 263,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>523 806,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>449 409,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>510 744,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>697 925,00</span>
                            </td>
                        </tr>
                        <tr class="bold">
                            <td class="column1" valign="top">
                                &nbsp;
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                <span class='bold'>ИТОГО АКТИВЫ</span>
                            </td>
                            <td class="column2" valign="top">
                                <span class='bold'>300</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 396 984,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 457 998,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 068 053,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 736 422,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 763 339,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 904 533,00</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <p class="fin_coefficient_comment">
                    Все финансовые показатели приведены в x1000 рублях, если не оговорено отдельно
                </p>
                <p class="caption">
                    ПАССИВЫ
                </p>
                <div class="internalblock">
                    <table class="findata">
                        <tr>
                            <th class="column1" valign="top">
                                &nbsp;
                            </th>
                            <th class="column2" valign="top">
                                Код
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2006
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2007
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2008
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2009
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2010
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2011
                                <br>
                            </th>
                        </tr>
                        <tr class="bold">
                            <td class="column1" valign="top">
                                <span class="bold">III. КАПИТАЛ И РЕЗЕРВЫ</span>
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Уставный капитал
                            </td>
                            <td class="column2" valign="top">
                                410
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                10,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                10,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                10,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                10,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                905 010,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                905 010,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Собственные акции, выкупленные у акционеров
                            </td>
                            <td class="column2" valign="top">
                                411
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Добавочный капитал
                            </td>
                            <td class="column2" valign="top">
                                420
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 029,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 029,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Резервный капитал
                            </td>
                            <td class="column2" valign="top">
                                430
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                в том числе: резервные фонды, образованные в соответствии с законодательством
                            </td>
                            <td class="column2" valign="top">
                                431
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                резервы, образованные в соответствии с учредительными документами
                            </td>
                            <td class="column2" valign="top">
                                432
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Нераспределенная прибыль (непокрытый убыток)
                            </td>
                            <td class="column2" valign="top">
                                470
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                -27 343,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                114 228,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                451 101,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                686 958,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                742 917,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                864 717,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                <span class='bold'>ИТОГО ПО РАЗДЕЛУ III.</span>
                            </td>
                            <td class="column2" valign="top">
                                <span class='bold'>490</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>-27 333,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>114 238,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>451 111,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>686 968,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 648 956,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 770 756,00</span>
                            </td>
                        </tr>
                        <tr class="bold" style="page-break-before:auto;">
                            <td class="column1" valign="top">
                                &nbsp;
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="bold">
                            <td class="column1" valign="top">
                                <span class="bold">IV. ДОЛГОСРОЧНЫЕ ОБЯЗАТЕЛЬСТВА</span>
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Займы и кредиты
                            </td>
                            <td class="column2" valign="top">
                                510
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                836 330,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Отложенные налоговые обязательства
                            </td>
                            <td class="column2" valign="top">
                                515
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                31 444,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                29 633,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Прочие долгосрочные обязательства
                            </td>
                            <td class="column2" valign="top">
                                520
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                <span class='bold'>ИТОГО ПО РАЗДЕЛУ IV.</span>
                            </td>
                            <td class="column2" valign="top">
                                <span class='bold'>590</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>0,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>0,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>836 330,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>0,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>31 444,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>29 633,00</span>
                            </td>
                        </tr>
                        <tr class="bold">
                            <td class="column1" valign="top">
                                &nbsp;
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="bold" style="page-break-before:auto;">
                            <td class="column1" valign="top">
                                <span class="bold">V. КРАТКОСРОЧНЫЕ ОБЯЗАТЕЛЬСТВА</span>
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Займы и кредиты
                            </td>
                            <td class="column2" valign="top">
                                610
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 514 517,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 509 644,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Кредиторская задолженность
                            </td>
                            <td class="column2" valign="top">
                                620
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                909 800,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                834 116,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                780 612,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                148 425,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                82 939,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                104 144,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                в том числе: Поставщики и подрядчики
                            </td>
                            <td class="column2" valign="top">
                                621
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                62 259,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                45 891,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                22 496,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                86 099,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                28 937,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                30 357,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Задолженность перед персоналом организации
                            </td>
                            <td class="column2" valign="top">
                                622
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Задолженность перед государственными внебюджетными фондами
                            </td>
                            <td class="column2" valign="top">
                                623
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Задолженность по налогам и сборам
                            </td>
                            <td class="column2" valign="top">
                                624
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                125 751,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                61 234,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                273 564,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                12 562,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                11 132,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                19 335,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Прочие кредиторы
                            </td>
                            <td class="column2" valign="top">
                                625
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                721 790,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                726 991,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                484 552,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                49 764,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                42 870,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                54 452,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Задолженность участникам (учредителям) по выплате доходов
                            </td>
                            <td class="column2" valign="top">
                                630
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                901 029,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Доходы будущих периодов
                            </td>
                            <td class="column2" valign="top">
                                640
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Резервы предстоящих расходов
                            </td>
                            <td class="column2" valign="top">
                                650
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Прочие краткосрочные обязательства
                            </td>
                            <td class="column2" valign="top">
                                660
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                <span class='bold'>ИТОГО ПО РАЗДЕЛУ V.</span>
                            </td>
                            <td class="column2" valign="top">
                                <span class='bold'>690</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 424 317,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 343 760,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>780 612,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 049 454,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>82 939,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>104 144,00</span>
                            </td>
                        </tr>
                        <tr class="bold">
                            <td class="column1" valign="top">
                                &nbsp;
                            </td>
                            <td class="column2" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                <span class='bold'>ИТОГО ПАССИВЫ</span>
                            </td>
                            <td class="column2" valign="top">
                                <span class='bold'>700</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 396 984,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 457 998,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>2 068 053,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 736 422,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 763 339,00</span>
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                <span class='bold'>1 904 533,00</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <p class="fin_coefficient_comment">
                    Все финансовые показатели приведены в x1000 рублях, если не оговорено отдельно
                </p>
                <!--cnblk24 Баланс 2--><h3>ОТЧЕТ О ПРИБЫЛЯХ И УБЫТКАХ</h3>
                <p class="caption">
                    &nbsp;
                </p>
                <div class="internalblock">
                    <table class="findata">
                        <tr>
                            <th class="column1" valign="top">
                                &nbsp;
                            </th>
                            <th class="column2" valign="top">
                                Код
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2006
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2007
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2008
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2009
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2010
                                <br>
                            </th>
                            <th class="column3_main_balance" align="right" valign="top">
                                01.01.2011
                                <br>
                            </th>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Выручка (нетто) от продажи товаров, продукции, работ, услуг (за минусом налога на добавленную стоимость, акцизов и аналогичных обязательных платежей)
                            </td>
                            <td class="column2" valign="top">
                                010
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                10 421,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                376 101,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 172 918,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                385 035,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                377 801,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                388 048,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Себестоимость проданных товаров, продукции, работ, услуг
                            </td>
                            <td class="column2" valign="top">
                                020
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 346,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                166 239,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                614 902,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                245 577,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                241 109,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                255 988,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Валовая прибыль
                            </td>
                            <td class="column2" valign="top">
                                029
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                9 075,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                209 862,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                558 016,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                139 458,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                136 692,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                132 060,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Коммерческие расходы
                            </td>
                            <td class="column2" valign="top">
                                030
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Административные расходы
                            </td>
                            <td class="column2" valign="top">
                                040
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                6 793,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                162,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                542,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                2 437,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                7 098,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                4 201,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Прибыль (убыток) от продаж
                            </td>
                            <td class="column2" valign="top">
                                050
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                2 282,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                209 700,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                557 474,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                137 021,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                129 594,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                127 859,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Проценты к получению
                            </td>
                            <td class="column2" valign="top">
                                060
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                641,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                24 683,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Проценты к уплате
                            </td>
                            <td class="column2" valign="top">
                                070
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                85 706,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                32 175,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Доходы от участия в других организациях
                            </td>
                            <td class="column2" valign="top">
                                080
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Прочие операционные доходы
                            </td>
                            <td class="column2" valign="top">
                                090
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                520,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                908,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                449 407,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 140,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 599,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Прочие операционные расходы
                            </td>
                            <td class="column2" valign="top">
                                100
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                5 213,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                68 649,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                48 217,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                239 380,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                18 081,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 837,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Внереализационные доходы
                            </td>
                            <td class="column2" valign="top">
                                120
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                6,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Внереализационные расходы
                            </td>
                            <td class="column2" valign="top">
                                130
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                8 817,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Прибыль (убыток) до налогообложения
                            </td>
                            <td class="column2" valign="top">
                                140
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                -11 742,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                141 571,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                424 459,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                314 873,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                113 294,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                152 304,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Отложенные налоговые активы
                            </td>
                            <td class="column2" valign="top">
                                141
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                1 810,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Отложенные налоговые обязательства
                            </td>
                            <td class="column2" valign="top">
                                142
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                31 444,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="column1" valign="top">
                                Текущий налог на прибыль
                            </td>
                            <td class="column2" valign="top">
                                150
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                0,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                88 301,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                79 016,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                25 891,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                32 314,00
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="column1" valign="top">
                                Чистая прибыль (убыток) отчетного периода
                            </td>
                            <td class="column2" valign="top">
                                190
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                -11 742,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                141 571,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                336 158,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                235 857,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                55 959,00
                            </td>
                            <td class="column3_main_balance" align="right" valign="top">
                                121 800,00
                            </td>
                        </tr>
                    </table>
                </div>
                <p class="fin_coefficient_comment">
                    Все финансовые показатели приведены в x1000 рублях, если не оговорено отдельно
                </p>
                <!--cnblk07 FoundersActual-->
                <p class="caption">
                    Учредители
                </p>
                <div class="internalblock">
                    <table class="founderdepender_block">
                        <tr>
                            <th colspan="2" style="border-width: 2px 0 0 0;">
                                Дата актуализации
                            </th>
                            <th colspan="2">
                                Доля
                            </th>
                            <th rowspan="2">
                            </th>
                        </tr>
                        <tr>
                            <th style="border-width: 2px 0 0 0;">
                                c
                            </th>
                            <th>
                                на
                            </th>
                            <th class="branch_coefficient">
                                x1000 рублей
                            </th>
                            <th>
                                %
                            </th>
                        </tr>
                        <tr>
                            <td class="branchcol1 ">
                                26.06.2009
                            </td>
                            <td class="branchcol2 ">
                                01.10.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="branchcol3">
                                10,00
                            </td>
                            <td class="branchcol4">
                                100,00
                            </td>
                            <td class="branchcol5" rowspan="1">
                                <span class="bold"> КОМПАНИЯ КИЛМВАСТ БЕХИР В.V.
                                    (Собственность иностранных юридических лиц)</span>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk40 FoundersHistory-->
                <p class="caption">
                    Учредители (История)
                </p>
                <div class="internalblock">
                    <table class="founderdepender_block">
                        <tr>
                            <th colspan="2" style="border-width: 2px 0 0 0;">
                                Дата актуализации
                            </th>
                            <th colspan="2">
                                Доля
                            </th>
                            <th rowspan="2">
                            </th>
                        </tr>
                        <tr>
                            <th style="border-width: 2px 0 0 0;">
                                c
                            </th>
                            <th>
                                на
                            </th>
                            <th class="branch_coefficient">
                                x1000 рублей
                            </th>
                            <th>
                                %
                            </th>
                        </tr>
                        <tr>
                            <td class="branchcol1 ">
                                01.09.2006
                            </td>
                            <td class="branchcol2 ">
                                25.06.2009<span class='cross_sign'><img src='../img/question.png' alt=''></span>
                            </td>
                            <td class="branchcol3">
                                10,00
                            </td>
                            <td class="branchcol4">
                                99,99
                            </td>
                            <td class="branchcol5" rowspan="1">
                                <span class="bold"> КОМПАНИЯ MARIDOZ SERVICES INC
                                    (Собственность иностранных юридических лиц)</span>
                                <div class="address_boss">
                                    СЕНТ-КИТС И НЕВИС<span class="address_menu_float">СЕНТ-КИТС И НЕВИС<span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">СЕНТ-КИТС И НЕВИС</span>
                                                    <span class="ajax_search_type">addrvirt</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="branchcol1 ">
                                01.09.2005
                            </td>
                            <td class="branchcol2 ">
                                31.08.2006<span class='cross_sign'><img src='../img/question.png' alt=''></span>
                            </td>
                            <td class="branchcol3">
                                10,00
                            </td>
                            <td class="branchcol4">
                                99,99
                            </td>
                            <td class="branchcol5" rowspan="1">
                                <span class="bold"> КОМПАНИЯ MARIDOZ SERVICES INC
                                    (Собственность иностранных юридических лиц)</span>
                                <div class="address_boss">
                                    СЕНТ-КИТС И НЕВИС<span class="address_menu_float">СЕНТ-КИТС И НЕВИС<span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">СЕНТ-КИТС И НЕВИС</span>
                                                    <span class="ajax_search_type">addrvirt</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="branchcol1 ">
                                01.09.2006
                            </td>
                            <td class="branchcol2 ">
                                25.06.2009<span class='cross_sign'><img src='../img/question.png' alt=''></span>
                            </td>
                            <td class="branchcol3">
                                0,00
                            </td>
                            <td class="branchcol4">
                                0,01
                            </td>
                            <td class="branchcol5" rowspan="2">
                                <span class="bold"> ГРАЖДАНКА РОССИИ
                                    (Частная собственность)</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="branchcol1 ">
                                01.09.2005
                            </td>
                            <td class="branchcol2 ">
                                31.08.2006
                            </td>
                            <td class="branchcol3">
                                0,00
                            </td>
                            <td class="branchcol4">
                                0,01
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk55 Egrul comp founders--><!--cnblk55 Egrul comp founders-->
                <p class="caption">
                    Учредители по данным ФНС РФ (ЕГРЮЛ) от 09.09.2011
                </p>
                <div class="internalblock">
                    <table class="block">
                        <tr>
                            <th style="border-width: 2px 0 0 0;">
                                Дата ГРН
                            </th>
                            <th>
                                ГРН
                            </th>
                            <th>
                                Доля,
                                <br>
                                <span style="font-size: 80%;">x1000 руб.</span>
                            </th>
                            <th style="border-width: 2px 0 0 0;">
                            </th>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                05.06.2009
                            </td>
                            <td class="egrulfound2">
                                2095029056263
                            </td>
                            <td class="egrulfound3">
                                905 010,00
                            </td>
                            <td class="egrulfound4" style="border-width: 2px 0 0 0;">
                                <span class="bold">Компания Kilmvast Beheer B.V.</span>
                                <div class="address_boss">
                                    <span class="address_menu_float">НИДЕРЛАНДЫ</span>
                                    <span class="address_menu_float">de Boelelaan 71083 HJ Amsterdam</span>
                                </div>
                                <div class="address_boss">
                                    <span class="no_wrap">Дата регистрации: 29.09.2000</span>
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="4">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                14.02.2007
                            </td>
                            <td class="egrulfound2">
                                2075029015378
                            </td>
                            <td class="egrulfound3">
                                5,00
                            </td>
                            <td class="egrulfound4" style="border-width: 2px 0 0 0;">
                                <span class="bold">Компания Maridoz Services Ins.</span>
                                <div class="address_boss">
                                    <span class="address_menu_float">СЕНТ-КИТС И НЕВИС</span>
                                    <span class="address_menu_float"></span>
                                </div>
                                <div class="address_boss">
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="4">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                15.07.2004
                            </td>
                            <td class="egrulfound2">
                                1045005511187
                            </td>
                            <td class="egrulfound3">
                                0,00
                            </td>
                            <td class="egrulfound4" style="border-width: 2px 0 0 0;">
                                <span class="bold">Лебедева Наталия Михайловна<span>
                                        <ul class="jd_menu">
                                            <li class="knopajka">
                                                <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                <span class="ajax_search_string">Лебедева Наталия Михайловна</span>
                                                <span class="ajax_search_type">chief_name</span>
                                                <span class="ajax_search_lang">ru</span>
                                                <span class="ajax_search_inn"></span>
                                                <span class="show_only_reports">0</span>
                                                <span class="transliterate">1</span>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </span></span>
                                <div class="address_boss">
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="4">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk36 timeline-->
                <p class="caption">
                    Изменение долей учредителей по историческим интервалам
                </p>
                <div class="internalblock">
                    <table class="timeline_block">
                        <tr>
                            <th colspan="2" style="border-width: 2px 0 0;">
                                Актуальна
                            </th>
                            <th rowspan="2">
                            </th>
                        </tr>
                        <tr>
                            <th class="branch_coefficient" style="border-width: 2px 0 0;">
                                рублей
                            </th>
                            <th>
                                %
                            </th>
                        </tr>
                        <tr class="separator_interval">
                            <td colspan="3">
                                <div class="separator_block">
                                    26.06.2009 - по текущий момент
                                </div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="branchcol3">
                                10 000,00
                            </td>
                            <td class="branchcol4">
                                100,00
                            </td>
                            <td class="branchcol5">
                                <span class="bold">КОМПАНИЯ КИЛМВАСТ БЕХИР В.V.
                                    (Собственность иностранных юридических лиц)</span>
                            </td>
                        </tr>
                        <tr class="separator_interval">
                            <td colspan="3">
                                <div class="separator_block">
                                    01.09.2006 - 25.06.2009
                                </div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="branchcol3">
                                1,00
                            </td>
                            <td class="branchcol4">
                                0,01
                            </td>
                            <td class="branchcol5">
                                <span class="bold">ГРАЖДАНКА РОССИИ
                                    (Частная собственность)</span>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="branchcol3">
                                9 999,00
                            </td>
                            <td class="branchcol4">
                                99,99
                            </td>
                            <td class="branchcol5">
                                <span class="bold">КОМПАНИЯ MARIDOZ SERVICES INC
                                    (Собственность иностранных юридических лиц)</span>
                                <div class="address_boss">
                                    СЕНТ-КИТС И НЕВИС<span class="address_menu_float">СЕНТ-КИТС И НЕВИС<span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">СЕНТ-КИТС И НЕВИС</span>
                                                    <span class="ajax_search_type">addrvirt</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                </div>
                            </td>
                        </tr>
                        <tr class="separator_interval">
                            <td colspan="3">
                                <div class="separator_block">
                                    01.09.2005 - 31.08.2006
                                </div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="branchcol3">
                                1,00
                            </td>
                            <td class="branchcol4">
                                0,01
                            </td>
                            <td class="branchcol5">
                                <span class="bold">ГРАЖДАНКА РОССИИ
                                    (Частная собственность)</span>
                                <div class="address_boss">
                                    РОССИЙСКАЯ ФЕДЕРАЦИЯ
                                </div>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="branchcol3">
                                9 999,00
                            </td>
                            <td class="branchcol4">
                                99,99
                            </td>
                            <td class="branchcol5">
                                <span class="bold">КОМПАНИЯ MARIDOZ SERVICES INC
                                    (Собственность иностранных юридических лиц)</span>
                                <div class="address_boss">
                                    СЕНТ-КИТС И НЕВИС<span class="address_menu_float">СЕНТ-КИТС И НЕВИС<span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">СЕНТ-КИТС И НЕВИС</span>
                                                    <span class="ajax_search_type">addrvirt</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk34 dependersActual--><!--cnblk41 dependersHistory--><!--cnblk36 coManagement-->
                <p class="caption">
                    Совмещение руководящих должностей: ЖЕРМЕН ЖАН-ПЬЕР
                    <br>
                    <span class="caption_comment">Результаты поиска могут выводить информацию о полных однофамильцах</span>
                </p>
                <div class="internalblock">
                    <table class="dolgnost_block">
                        <tr>
                            <th colspan="2" style="border-width: 2px 0 0 0;">
                                Дата актуализации
                            </th>
                            <th rowspan="2">
                                Должность
                            </th>
                            <th rowspan="2">
                            </th>
                        </tr>
                        <tr>
                            <th style="border-width: 2px 0 0 0;">
                                c
                            </th>
                            <th>
                                на
                            </th>
                        </tr>
                        <tr>
                            <td class="dolgnostcol1">
                                27.04.2011
                            </td>
                            <td class="dolgnostcol2">
                                16.08.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="dolgnostcol3">
                                ЛИКВИДАТОР
                            </td>
                            <td class='dolgnostcol4'>
                                <span class="bold">Ликвидационная комиссия Общество с ограниченной ответственностью "ЦМОС"(промежуточный баланс )
                                    (Собственность иностранных юридических лиц)</span>
                                <div class="address_boss">
                                    <span class="address_menu_float">г Москва, ул Верхняя Красносельская, д 3 А<span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">г Москва, ул Верхняя Красносельская, д 3 А</span>
                                                    <span class="ajax_search_type">addrvirt</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="dont_repeat_bsnid">4069987</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                </div>
                                <div class="address_boss">
                                    <span class="address_menu_float">ОКПО:<a href="../info/?id=4069987" target="_blank">84008691</a><span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">4069987</span>
                                                    <span class="ajax_search_type">id_comp</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                    ИНН:<span class="bold">7707644595</span>
                                    ОГРН:<span class="bold">1077762658710 (от 20.11.2007)</span>
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="4">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="dolgnostcol1">
                                11.05.2010
                            </td>
                            <td class="dolgnostcol2">
                                01.07.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="dolgnostcol3">
                                Управляющая компания ООО "АШАН"
                            </td>
                            <td class='dolgnostcol4'>
                                <span class="bold">Общество с ограниченной ответственностью "АШАН НЕДВИЖИМОСТЬ"
                                    (Собственность иностранных юридических лиц)</span>
                                <div class="address_boss">
                                    <span class="address_menu_float">г Москва, ул Верхняя Красносельская, д 3 А<span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">г Москва, ул Верхняя Красносельская, д 3 А</span>
                                                    <span class="ajax_search_type">addrvirt</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="dont_repeat_bsnid">1388565</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                </div>
                                <div class="address_boss">
                                    <span class="address_menu_float">ОКПО:<a href="../info/?id=1388565" target="_blank">57079277</a><span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">1388565</span>
                                                    <span class="ajax_search_type">id_comp</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                    ИНН:<span class="bold">7703280481</span>
                                    ОГРН:<span class="bold">1037739094800 (от 15.01.2003)</span>
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="4">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="dolgnostcol1">
                                01.09.2007
                            </td>
                            <td class="dolgnostcol2">
                                01.07.2011<span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td class="dolgnostcol3">
                                ГЕНЕРАЛЬНЫЙ ДИРЕКТОР
                            </td>
                            <td class='dolgnostcol4'>
                                <span class="bold">ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "АШАН"
                                    (Собственность иностранных юридических лиц)</span>
                                <div class="address_boss">
                                    <span class="address_menu_float">МОСКОВСКАЯ ОБЛАСТЬ, Г МЫТИЩИ, ОСТАШКОВСКОЕ ШОССЕ, Д 1<span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">МОСКОВСКАЯ ОБЛАСТЬ, Г МЫТИЩИ, ОСТАШКОВСКОЕ ШОССЕ, Д 1</span>
                                                    <span class="ajax_search_type">addrvirt</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="dont_repeat_bsnid">1385969</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                </div>
                                <div class="address_boss">
                                    <span class="address_menu_float">ОКПО:<a href="../info/?id=1385969" target="_blank">57041869</a><span>
                                            <ul class="jd_menu">
                                                <li class="knopajka">
                                                    <span class="bl">&nbsp;&nbsp;&nbsp;</span>
                                                    <span class="ajax_search_string">1385969</span>
                                                    <span class="ajax_search_type">id_comp</span>
                                                    <span class="ajax_search_lang">ru</span>
                                                    <span class="ajax_search_inn"></span>
                                                    <span class="show_only_reports">0</span>
                                                    <span class="transliterate">1</span>
                                                    <ul>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </span></span>
                                    ИНН:<span class="bold">7703270067</span>
                                    ОГРН:<span class="bold">1027739329408 (от 07.10.2002)</span>
                                </div>
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="4">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk57 Egrul licence--><!--cnblk57 Egrul licences--><!--cnblk58 Egrul certificates свидетельства--><!--cnblk58 Egrul certificate свидетельства-->
                <p class="caption">
                    Выданные свидетельства по данным ФНС РФ (ЕГРЮЛ) от 09.09.2011
                </p>
                <div class="internalblock">
                    <table class="block">
                        <tr>
                            <th style="border-width: 2px 0 0 0;">
                                Дата выдачи
                            </th>
                            <th>
                                ГРН
                            </th>
                            <th>
                                Статус
                            </th>
                            <th>
                                Серия
                            </th>
                            <th style="border-width: 2px 0 0 0;">
                                Номер
                            </th>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                08.06.2009
                            </td>
                            <td class="egrulfound2">
                                2095029056252
                            </td>
                            <td class="egrulfound5">
                                действующее
                            </td>
                            <td class="egrulfound5">
                                50
                            </td>
                            <td>
                                010897632
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                08.06.2009
                            </td>
                            <td class="egrulfound2">
                                2095029056263
                            </td>
                            <td class="egrulfound5">
                                действующее
                            </td>
                            <td class="egrulfound5">
                                50
                            </td>
                            <td>
                                010897631
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                31.07.2007
                            </td>
                            <td class="egrulfound2">
                                2075029055550
                            </td>
                            <td class="egrulfound5">
                                действующее
                            </td>
                            <td class="egrulfound5">
                                50
                            </td>
                            <td>
                                009538461
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                19.12.2006
                            </td>
                            <td class="egrulfound2">
                                2065029224291
                            </td>
                            <td class="egrulfound5">
                                действующее
                            </td>
                            <td class="egrulfound5">
                                50
                            </td>
                            <td>
                                009097132
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                29.12.2004
                            </td>
                            <td class="egrulfound2">
                                2045005525959
                            </td>
                            <td class="egrulfound5">
                                действующее
                            </td>
                            <td class="egrulfound5">
                                50
                            </td>
                            <td>
                                006071572
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                19.11.2004
                            </td>
                            <td class="egrulfound2">
                                2045005521273
                            </td>
                            <td class="egrulfound5">
                                действующее
                            </td>
                            <td class="egrulfound5">
                                50
                            </td>
                            <td>
                                006021319
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                18.11.2004
                            </td>
                            <td class="egrulfound2">
                                2045005521251
                            </td>
                            <td class="egrulfound5">
                                действующее
                            </td>
                            <td class="egrulfound5">
                                50
                            </td>
                            <td>
                                006021317
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                15.07.2004
                            </td>
                            <td class="egrulfound2">
                                1045005511187
                            </td>
                            <td class="egrulfound5">
                                действующее
                            </td>
                            <td class="egrulfound5">
                                50
                            </td>
                            <td>
                                006004757
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="5">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk59 Egrul changes внесенные записи--><!--cnblk59 Egrul changes внесенные записи-->
                <p class="caption">
                    Записи по данным ФНС РФ (ЕГРЮЛ) от 09.09.2011
                </p>
                <div class="internalblock">
                    <table class="block">
                        <tr>
                            <th style="border-width: 2px 0 0 0;">
                                Дата ГРН
                            </th>
                            <th>
                                ГРН
                            </th>
                            <th style="border-width: 2px 0 0 0;">
                            </th>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                05.06.2009
                            </td>
                            <td class="egrulfound2">
                                2095029056252
                            </td>
                            <td>
                                Внесение изменений в сведения о юридическом лице, содержащиеся в Едином государственном реестре юридических лиц, связанных с внесением изменений в учредительные документы, на основании заявления
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                05.06.2009
                            </td>
                            <td class="egrulfound2">
                                2095029056263
                            </td>
                            <td>
                                Внесение изменений в сведения о юридическом лице, содержащиеся в Едином государственном реестре юридических лиц, не связанных с внесением изменений в учредительные документы, на основании заявления
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                31.07.2007
                            </td>
                            <td class="egrulfound2">
                                2075029055550
                            </td>
                            <td>
                                Внесение изменений в сведения о юридическом лице, содержащиеся в Едином государственном реестре юридических лиц, не связанных с внесением изменений в учредительные документы, на основании заявления
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                14.02.2007
                            </td>
                            <td class="egrulfound2">
                                2075029015378
                            </td>
                            <td>
                                Внесение изменений в сведения о юридическом лице, включенные в Единый государственный реестр юридических лиц на основании представленных юридическим лицом документов, в связи ошибками допущенными регистрирующим органом
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                19.12.2006
                            </td>
                            <td class="egrulfound2">
                                2065029224291
                            </td>
                            <td>
                                Внесение изменений в сведения о юридическом лице, содержащиеся в Едином государственном реестре юридических лиц, связанных с внесением изменений в учредительные документы, на основании заявления
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                13.07.2006
                            </td>
                            <td class="egrulfound2">
                                2065029164891
                            </td>
                            <td>
                                Внесение в Единый государственный реестр юридических лиц сведений о регистрации юридического лица в качестве страхователя в территориальном органе Пенсионного фонда Российской Федерации
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                18.04.2006
                            </td>
                            <td class="egrulfound2">
                                2065029074592
                            </td>
                            <td>
                                Внесение в Единый государственный реестр юридических лиц сведений о регистрации юридического лица в качестве страхователя в территориальном фонде обязательного медицинского страхования
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                18.04.2006
                            </td>
                            <td class="egrulfound2">
                                2065029090146
                            </td>
                            <td>
                                Внесение в Единый государственный реестр юридических лиц сведений о регистрации юридического лица в качестве страхователя в территориальном органе Пенсионного фонда Российской Федерации
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                29.12.2004
                            </td>
                            <td class="egrulfound2">
                                2045005525959
                            </td>
                            <td>
                                Внесение изменений в сведения о юридическом лице, содержащиеся в Едином государственном реестре юридических лиц, не связанных с внесением изменений в учредительные документы, на основании заявления
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                19.11.2004
                            </td>
                            <td class="egrulfound2">
                                2045005521273
                            </td>
                            <td>
                                Внесение изменений в сведения о юридическом лице, содержащиеся в Едином государственном реестре юридических лиц, не связанных с внесением изменений в учредительные документы, на основании заявления
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                18.11.2004
                            </td>
                            <td class="egrulfound2">
                                2045005521251
                            </td>
                            <td>
                                Внесение изменений в сведения о юридическом лице, содержащиеся в Едином государственном реестре юридических лиц, связанных с внесением изменений в учредительные документы, на основании заявления
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                15.07.2004
                            </td>
                            <td class="egrulfound2">
                            </td>
                            <td>
                                Внесение в Единый государственный реестр юридических лиц сведений об учете юридического лица в налоговом органе
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="egrulfound1">
                                15.07.2004
                            </td>
                            <td class="egrulfound2">
                                1045005511187
                            </td>
                            <td>
                                Государственная регистрация юридического лица при создании
                            </td>
                        </tr>
                        <tr class="separator">
                            <td colspan="3">
                                <div class="separator_block">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk60 Egrul реестродержатели--><!--cnblk60 Egrul реестродержатели--><!--cnblk45 примечания к отчету--><h3>Примечания</h3>
                <p class="caption">
                    Источники<a name="origin_anchor"></a>
                </p>
                <div class="internalblock">
                    <table class="block">
                        <tr>
                            <td>
                                <span class="footnote_comment">1</span>
                                &#8212; Росстат (Если не указана сноска, то источник информации &#8212; Росстат)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="footnote_comment">2</span>
                                &#8212; Баланс
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="footnote_comment">3</span>
                                &#8212; ЕГРЮЛ
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="footnote_comment">4</span>
                                &#8212; НКБ
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="footnote_comment">5</span>
                                &#8212; Компания
                            </td>
                        </tr>
                    </table>
                </div>
                <p class="caption_without_indent">
                    Знаки<a name="origin_anchor"></a>
                </p>
                <div class="internalblock">
                    <table class="block_notes_badge">
                        <tr>
                            <td class="col1">
                                <span class='actual_sign'><img src='../img/galka.png' alt=''></span>
                            </td>
                            <td>
                                последнее обновление данных компании прошло не ранее чем за 14 месяцев от текущей даты
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <span class='cross_sign'><img src='../img/question.png' alt=''></span>
                            </td>
                            <td>
                                последнее обновление данных компании прошло ранее чем за 14 месяцев от текущей даты
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <span class='cross_sign'><img src='../img/search_ico_537cae_light.gif' alt=''></span>
                            </td>
                            <td>
                                Быстрый переход к результатам поиска по строке и к выбору отчетов. В меню выводится до 10 компаний. Для полного просмотра результатов поиска &#8212; <b>"Перейти к списку"</b>.
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk09 universal credit rating-->
                <p class="caption">
                    Универсальный кредитный рейтинг
                </p>
                <div class="internalblock">
                    <table class="block">
                        <tr>
                            <th class="col1_rating">
                                Рейтинг
                            </th>
                            <th class="col2_rating">
                                Собственный капитал от
                            </th>
                            <th class="col2_rating">
                                Собственный капитал до
                            </th>
                            <th class="col3_rating">
                            </th>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                5A
                            </td>
                            <td class="col2_rating">
                                450 000 000
                            </td>
                            <td class="col2_rating">
                                и более
                            </td>
                            <td class="col3_rating" rowspan="13">
                                <p class="comments_reiting">
                                    Система рейтингов состоит из двух частей: индикаторов финансового потенциала и риска кредитования
                                    <br>
                                    Пример:2А2
                                    <br>
                                    2A - это оценка величины собственного капитала и 2 - индикатора кредитного риска
                                    <br>
                                    Индикатор финансового потенциала базируется на данных о величине собственного или объявленного                    (размещенного) капитала.
                                    <br>
                                    N - Будет выводиться в случаях отрицательного значения собственного капитала
                                    <br>
                                    O - Величина собственного капитала не определена ввиду отсутствия соответствующих счетов за последний                    год
                                    <br>
                                    <br>
                                    Индикатор риска отражает вероятность ликвидации предприятия в диапазоне от 1 до 6
                                    <br>
                                    1 - Продолжать сделку - и предоставлять значительные льготы
                                    <br>
                                    2 - Продолжать сделку
                                    <br>
                                    3 - Продолжать сделку, но тщательно контролировать ее ход
                                    <br>
                                    4 - Принять соответствующие меры подстраховки прежде, чем предоставлять кредит, получить личные гарантии
                                    <br>
                                    5 - Бизнес отношения - предмет доверия
                                    <br>
                                    6 - Бизнес отношения отклоняются
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                4A
                            </td>
                            <td class="col2_rating">
                                315 000 000
                            </td>
                            <td class="col2_rating">
                                449 999 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                3A
                            </td>
                            <td class="col2_rating">
                                225 000 000
                            </td>
                            <td class="col2_rating">
                                314 999 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                2A
                            </td>
                            <td class="col2_rating">
                                157 500 000
                            </td>
                            <td class="col2_rating">
                                224 999 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                1A
                            </td>
                            <td class="col2_rating">
                                112 500 000
                            </td>
                            <td class="col2_rating">
                                157 499 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                A
                            </td>
                            <td class="col2_rating">
                                85 500 000
                            </td>
                            <td class="col2_rating">
                                112 499 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                B
                            </td>
                            <td class="col2_rating">
                                63 000 000
                            </td>
                            <td class="col2_rating">
                                85 499 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                C
                            </td>
                            <td class="col2_rating">
                                45 000 000
                            </td>
                            <td class="col2_rating">
                                62 999 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                D
                            </td>
                            <td class="col2_rating">
                                31 500 000
                            </td>
                            <td class="col2_rating">
                                44 999 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                E
                            </td>
                            <td class="col2_rating">
                                18 000 000
                            </td>
                            <td class="col2_rating">
                                31 499 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                F
                            </td>
                            <td class="col2_rating">
                                9 000 000
                            </td>
                            <td class="col2_rating">
                                17 999 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                G
                            </td>
                            <td class="col2_rating">
                                4 500 000
                            </td>
                            <td class="col2_rating">
                                8 999 999
                            </td>
                        </tr>
                        <tr>
                            <td class="col1_rating">
                                H
                            </td>
                            <td class="col2_rating">
                                0
                            </td>
                            <td class="col2_rating">
                                4 499 999
                            </td>
                        </tr>
                    </table>
                </div>
                <!--cnblk39 bottom-->
                <br>
                <br>
                119021, г. Москва, Олсуфьевский пер., д. 8, стр. 3;
                <br>
                Телефон: +7 (495) 229-67-47 (многоканальный)
                <br>
                Факс: +7 (499) 246-01-75
                <br>
                E-mail: <a href="mailto:nkb@creditnet.ru">nkb@creditnet.ru</a>
                <br>
                © 2009 Национальное Кредитное Бюро. Все права защищены.
                <br>
                <br>
                <br>
                <div class="counter">
                    <!--Rating@Mail.ru COUNTEr-->
                    <script language="JavaScript" type="text/javascript">
                        <!--
                        d = document;
                        var a = '';
                        a += ';r=' + escape(d.referrer)
                        js = 10//-->
                    </script>
                    <script language="JavaScript1.1" type="text/javascript">
                        <!--
                        a += ';j=' + navigator.javaEnabled()
                        js = 11//-->
                    </script>
                    <script language="JavaScript1.2" type="text/javascript">
                        <!--
                        s = screen;
                        a += ';s=' + s.width + '*' + s.height
                        a += ';d=' + (s.colorDepth ? s.colorDepth : s.pixelDepth)
                        js = 12//-->
                    </script>
                    <script language="JavaScript1.3" type="text/javascript">
                        <!--
                        js = 13//-->
                    </script>
                    <script language="JavaScript" type="text/javascript">
                        <!--
                        d.write('<a href="http://top.mail.ru/jump?from=211652"' +
                        ' target=_top><img src="http://da.c3.b3.a0.top.list.ru/counter' +
                        '?id=211652;t=130;js=' +
                        js +
                        a +
                        ';rand=' +
                        Math.random() +
                        '" alt="Рейтинг@Mail.ru"' +
                        ' border=0 height=40 width=88/><\/a>')
                        if (11 < js)
                            d.write('<' + '!-- ')//-->
                    </script>
                    <noscript>
                        <a target=_top href="http://top.mail.ru/jump?from=211652"><img src="http://da.c3.b3.a0.top.list.ru/counter?js=na;id=211652;t=130" border=0 height=40 width=88 alt="Рейтинг@Mail.ru"/></a>
                    </noscript>
                    <script language="JavaScript" type="text/javascript">
                        <!--
                        if (11 < js)
                            d.write('--' + '>')//-->
                    </script>
                    <!--/COUNTER--><!-- SpyLOG f:0211 -->
                    <script language="javascript">
                        <!--
                        Mu = "u5397.47.spylog.com";
                        Md = document;
                        Mnv = navigator;
                        Mp = 1;
                        Mn = (Mnv.appName.substring(0, 2) == "Mi") ? 0 : 1;
                        Mrn = Math.random();
                        Mt = (new Date()).getTimezoneOffset();
                        Mz = "p=" + Mp + "&rn=" + Mrn + "&t=" + Mt;
                        My = "";
                        My += "<a href='http://" + Mu + "/cnt?cid=539747&f=3&p=" + Mp + "&rn=" + Mrn + "' target='_blank'>";
                        My += "<img src='http://" + Mu + "/cnt?cid=539747&" + Mz + "&r=" + escape(Md.referrer) + "&pg=" + escape(window.location.href) + "' border=0 width=88 height=31 alt='SpyLOG'>";
                        My += "</a>";
                        Md.write(My);//-->
                    </script>
                    <noscript>
                        <a href="http://u5397.47.spylog.com/cnt?cid=539747&f=3&p=1" target="_blank"><img src="http://u5397.47.spylog.com/cnt?cid=539747&p=1" alt='SpyLOG' border='0' width=88 height=31></a>
                    </noscript><!-- SpyLOG --><!--begin of Top100 logo--><a href="http://top100.rambler.ru/top100/"><img src="http://top100-images.rambler.ru/top100/w1.gif" alt="Rambler's Top100" width=88 height=31 border=0></a><!--end of Top100 logo --><!--begin of Rambler's Top100 code --><a href="http://top100.rambler.ru/top100/"><img src="http://counter.rambler.ru/top100.cnt?394714" alt="" width=1 height=1 border=0></a><!--end of Top100 code-->
                </div>
            </div>
        </div>
    </body>
</html>
