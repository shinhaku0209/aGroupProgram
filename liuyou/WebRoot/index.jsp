<%@ page language="java" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
    <title>Wei Hai online booking system</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <LINK href="qtimages/style.css" type=text/css rel=stylesheet>
    <style type="text/css">
        <!--
        .STYLE1 {
            color: #006666
        }

        .STYLE2 {
            color: #006666;
            font-weight: bold;
        }

        .STYLE5 {
            color: blue;
            font-weight: bold;
        }

        .STYLE6 {
            color: #FFCC33
        }

        -->
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@include file="qttop.jsp" %>


<table width="978" height="1013" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
    <tr>
        <td height="864">
            <table id="__01" height="785">
                <tr>
                    <td>
                        <%@ include file="qtleft.jsp" %>
                    </td>
                    <td>
                        <table id="__01" width="758" height="183" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td><img src="qtimages/1_02_02_02_02_01.jpg" width="12" height="183" alt=""></td>
                                <td width="733" height="183">
                                    <table width="100%" height="100%" border="0" align="center" cellpadding="0"
                                           cellspacing="0">
                                        <tr>
                                            <%
                                                String sql = "";
                                                sql = "select  * from jiudianxinxi where zhaopian<>''";

                                                sql = sql + " order by id desc limit 0,5";
                                                ResultSet RS_result = connDbBean.executeQuery(sql);
                                                String id = "";
                                                String biaoti = "";
                                                String tupian = "";

                                                int i = 0;


                                                while (RS_result.next()) {
                                                    i = i + 1;
                                                    id = RS_result.getString("id");
                                                    biaoti = RS_result.getString("mingcheng");
                                                    tupian = RS_result.getString("zhaopian");


                                            %>
                                            <td>
                                                <table width="89%" height="100%" border="0" align="center"
                                                       cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td height="134" align="center"><a
                                                                href="jiudianxinxidetail.jsp?id=<%=id%>"><img
                                                                src="<%=tupian%>" width="117" height="117"
                                                                border="0"></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25" align="center"><%=biaoti%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <%
                                                }
                                            %>
                                        </tr>
                                    </table>
                                </td>
                                <td><img src="qtimages/1_02_02_02_02_03.jpg" width="13" height="183" alt=""></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table id="__01" width="758" height="236" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="758" height="42" background="qtimages/1_02_02_02_01.jpg">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="5%">&nbsp;</td>
                                <td width="95%" class="STYLE2">content</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="__01" width="758" height="183" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="12" background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                                <td width="733" height="183">
                                    <table width="100%" height="100%" border="0" align="center" cellpadding="0"
                                           cellspacing="0">
                                        <tr>

                                            <td valign="top"><p align="center"></p>
                                                <table width="98%" border="0" align="center" cellpadding="0"
                                                       cellspacing="0" bordercolor="#F6C978"
                                                       style="border-collapse:collapse" class="newsline">
                                                    <tr>
                                                        <td height="110" align="left">The city is located at the north
                                                            latitude of 37, is the easternmost point of Shandong
                                                            Province,
                                                            is also China's earliest sunrise coastal city, nearly a
                                                            thousand kilometers of coastline has rich natural landscape
                                                            resources and the first emperor east tour to worship the day
                                                            of the millennium cultural heritage, is one of the seven
                                                            children of the war of the nation,
                                                            many islands, forest coverage rate of about 40%, is a
                                                            national civilized city
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                                <td width="13" background="qtimages/1_02_02_02_02_03.jpg">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>