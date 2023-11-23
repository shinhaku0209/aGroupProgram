<%@ page language="java" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>Weihai</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Transit Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
</head>
<body>
<!-- banner -->
<div class="banner">
    <!-- container -->
    <div class="container">
        <div class="header">
            <div class="logo">
                <a href="index.html">Weihai</a>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="top-nav">
            <span class="menu">Menu</span>
            <ul class="nav1">
                <li><a href="index.html" class="active">Home page</a></li>
                <li><a href="#xisu" class="scroll">culture</a></li>
                <li><a href="map.jsp">map search</a></li>
                <li><a href="#news" class="scroll">scence spot</a></li>
                <li><a href="contact.html">login</a></li>
            </ul>
            <!-- script-for-menu -->
            <script>
                $("span.menu").click(function () {
                    $("ul.nav1").slideToggle(300, function () {
                        // Animation complete.
                    });
                });
            </script>
            <!-- /script-for-menu -->
        </div>
    </div>
</div>
<!-- //banner -->
<table width="978" height="1081" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
    <tr>
        <td></td>
    </tr>
    <tr>
        <td valign="top">
            <table id="__01" width="978" height="785" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top">
                        <table id="__01" width="758" height="785" border="0" cellpadding="0" cellspacing="0">

                            <tr>
                                <td height="785" valign="top">
                                    <table id="__01" width="758" height="100%" border="0" cellpadding="0"
                                           cellspacing="0">
                                        <tr>
                                            <td width="758" height="42" background="qtimages/1_02_02_02_01.jpg">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5%">&nbsp;</td>
                                                        <td width="95%" class="STYLE2"><strong>MAP</strong></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="100%" valign="top">
                                                <table id="__01" width="758" height="100%" border="0" cellpadding="0"
                                                       cellspacing="0">
                                                    <tr>
                                                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                                                        <td width="733" height="100%" valign="top">
                                                            <br>

                                                            <script type="text/javascript"
                                                                    src="https://api.map.baidu.com/api?v=3.0&ak=qU5CAH0hnIypI57MDMkKsy3KSuftDfW1"></script>

                                                            <!--�ٶȵ�ͼ����-->
                                                            <div style="width:697px;height:550px;border:#ccc solid 1px;"
                                                                 id="dituContent"></div>

                                                            <script type="text/javascript">
                                                                //�����ͳ�ʼ����ͼ������
                                                                function initMap() {
                                                                    createMap();//������ͼ
                                                                    setMapEvent();//���õ�ͼ�¼�
                                                                    addMapControl();//���ͼ���ӿؼ�
                                                                }

                                                                //������ͼ������
                                                                function createMap() {
                                                                    var map = new BMap.Map("dituContent");//�ڰٶȵ�ͼ�����д���һ����ͼ
                                                                    var point = new BMap.Point(122.197261, 37.510294);//����һ�����ĵ�����
                                                                    map.centerAndZoom(point, 10);//�趨��ͼ�����ĵ�����겢����ͼ��ʾ�ڵ�ͼ������
                                                                    window.map = map;//��map�����洢��ȫ��
                                                                }

                                                                //��ͼ�¼����ú�����
                                                                function setMapEvent() {
                                                                    map.enableDragging();//���õ�ͼ��ק�¼���Ĭ������(�ɲ�д)
                                                                    map.enableScrollWheelZoom();//���õ�ͼ���ַŴ���С
                                                                    map.enableDoubleClickZoom();//�������˫���Ŵ�Ĭ������(�ɲ�д)
                                                                    map.enableKeyboard();//���ü����������Ҽ��ƶ���ͼ
                                                                }

                                                                //��ͼ�ؼ����Ӻ�����
                                                                function addMapControl() {
                                                                    //���ͼ���������ſؼ�
                                                                    var ctrl_nav = new BMap.NavigationControl({
                                                                        anchor: BMAP_ANCHOR_TOP_LEFT,
                                                                        type: BMAP_NAVIGATION_CONTROL_LARGE
                                                                    });
                                                                    map.addControl(ctrl_nav);
                                                                    //���ͼ����������ͼ�ؼ�
                                                                    var ctrl_ove = new BMap.OverviewMapControl({
                                                                        anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
                                                                        isOpen: 1
                                                                    });
                                                                    map.addControl(ctrl_ove);
                                                                    //���ͼ�����ӱ����߿ؼ�
                                                                    var ctrl_sca = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});
                                                                    map.addControl(ctrl_sca);
                                                                }


                                                                initMap();//�����ͳ�ʼ����ͼ
                                                            </script>

                                                        </td>
                                                        <td width="13" background="qtimages/1_02_02_02_02_03.jpg">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="11"><img src="qtimages/1_02_02_02_03.jpg" width="758"
                                                                 height="11" alt=""></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

</table>

</body>
</html>