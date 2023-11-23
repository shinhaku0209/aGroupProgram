<%@ page language="java" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
    <title>North Village Tourism Website</title>
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
            color: #FFFFFF;
            font-weight: bold;
        }

        .STYLE6 {
            color: #FFCC33
        }

        .STYLE7 {
            color: #0066CC;
            font-weight: bold;
        }

        -->
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%@ include file="qttop.jsp" %>
<%
    String id = request.getParameter("id");
    connDbBean.executeUpdate("update xinwentongzhi set dianjilv=dianjilv+1 where id=" + id);
%>
<table width="978" height="1081" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
    <tr>
        <td></td>
    </tr>
    <tr>
        <td valign="top">
            <table id="__01" width="978" height="785" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top">
                        <%@ include file="qtleft.jsp" %>
                    </td>
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
                                                        <td width="95%" class="STYLE2"><strong>Hotel
                                                            Information</strong></td>
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
                                                        <td width="733" height="183" valign="top">
                                                            <p align="center">
                                                                <%
                                                                    String sql = "select * from jiudianxinxi where id=" + id;
                                                                    String bianhao = "";
                                                                    String mingcheng = "";
                                                                    String xingji = "";
                                                                    String dizhi = "";
                                                                    String dianhua = "";
                                                                    String zhaopian = "";
                                                                    String beizhu = "";
                                                                    ResultSet RS_result = connDbBean.executeQuery(sql);
                                                                    while (RS_result.next()) {
                                                                        bianhao = RS_result.getString("bianhao");
                                                                        mingcheng = RS_result.getString("mingcheng");
                                                                        xingji = RS_result.getString("xingji");
                                                                        dizhi = RS_result.getString("dizhi");
                                                                        dianhua = RS_result.getString("dianhua");
                                                                        zhaopian = RS_result.getString("zhaopian");
                                                                        beizhu = RS_result.getString("beizhu");
                                                                    }
                                                                %>
                                                            </p>
                                                            <table width="100%" border="1" align="center"
                                                                   cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
                                                                   style="border-collapse:collapse">
                                                                <td width='11%' height="35">Number:</td>
                                                                <td width='39%' height="35"><%=bianhao%>
                                                                </td>
                                                                <td colspan="2" rowspan="5"><img src="<%=zhaopian%>"
                                                                                                 width="210"
                                                                                                 height="170"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="35">Name:</td>
                                                                    <td height="35"><%=mingcheng%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width='11%' height="35">Star:</td>
                                                                    <td width='39%' height="35"><%=xingji%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="35">Address:</td>
                                                                    <td height="35"><%=dizhi%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width='11%' height="35">Phone:</td>
                                                                    <td width='39%' height="35"><%=dianhua%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width='11%' height="73">Note:</td>
                                                                    <td colspan="3"><%=beizhu%>
                                                                    </td>
                                                                <tr>
                                                                    <td colspan="4" align="center">
                                                                        <table width="100%" border="1" align="center"
                                                                               cellpadding="3" cellspacing="1"
                                                                               bordercolor="00FFFF"
                                                                               style="border-collapse:collapse">
                                                                            <tr>
                                                                                <td width="30" align="center"
                                                                                    bgcolor="CCFFFF">Number
                                                                                </td>
                                                                                <td width="114" bgcolor='#CCFFFF'>
                                                                                    Hotel
                                                                                </td>
                                                                                <td width="68" bgcolor='#CCFFFF'>Room
                                                                                    Number
                                                                                </td>
                                                                                <td width="78" bgcolor='#CCFFFF'>Type
                                                                                </td>
                                                                                <td width="71" bgcolor='#CCFFFF'>Size
                                                                                </td>
                                                                                <td width="70" bgcolor='#CCFFFF'>Price
                                                                                </td>
                                                                                <td width="155" bgcolor='#CCFFFF'>Note
                                                                                </td>
                                                                                <td width="60" align="center"
                                                                                    bgcolor="CCFFFF">Operation
                                                                                </td>
                                                                            </tr>
                                                                            <%
                                                                                int curpage = 1;//Current page
                                                                                int page_record = 10;//Number of records displayed per page
                                                                                int zgs = 0;
                                                                                int zys = 0;
                                                                                String hsgnpage = request.getParameter("page");
                                                                                String fysql = "select count(id) as ss from kefang where jiudian='" + mingcheng + "'";
                                                                                ResultSet RS_resultfy = connDbBean.executeQuery(fysql);
                                                                                while (RS_resultfy.next()) {
                                                                                    zgs = Integer.parseInt(RS_resultfy.getString("ss"));
                                                                                    zys = zgs / page_record + 1;
                                                                                }
                                                                                if (hsgnpage != null) {
                                                                                    curpage = Integer.parseInt(request.getParameter("page"));//Get the value passed, the page to be displayed
                                                                                } else {
                                                                                    curpage = 1;
                                                                                }
                                                                                if (curpage == 0) {
                                                                                    curpage = 1;
                                                                                }
                                                                                if (curpage > zys) {
                                                                                    curpage = zys;
                                                                                }
                                                                                int curpage2 = curpage - 1;
                                                                                sql = "";
                                                                                sql = "select  * from kefang where jiudian='" + mingcheng + "' and 1=1 ";

                                                                                if (request.getParameter("jiudian") == "" || request.getParameter("jiudian") == null) {
                                                                                } else {
                                                                                    sql = sql + " and jiudian like '%" + new String(request.getParameter("jiudian").getBytes("8859_1")) + "%'";
                                                                                }
                                                                                if (request.getParameter("kefangbianhao") == "" || request.getParameter("kefangbianhao") == null) {
                                                                                } else {
                                                                                    sql = sql + " and kefangbianhao like '%" + new String(request.getParameter("kefangbianhao").getBytes("8859_1")) + "%'";
                                                                                }
                                                                                if (request.getParameter("leixing") == "All" || request.getParameter("leixing") == null) {
                                                                                } else {
                                                                                    sql = sql + " and leixing like '%" + new String(request.getParameter("leixing").getBytes("8859_1")) + "%'";
                                                                                }
                                                                                if (request.getParameter("daxiao") == "All" || request.getParameter("daxiao") == null) {
                                                                                } else {
                                                                                    sql = sql + " and daxiao like '%" + new String(request.getParameter("daxiao").getBytes("8859_1")) + "%'";
                                                                                }
                                                                                sql = sql + " order by id desc limit " + curpage2 + "," + page_record;
                                                                                RS_result = connDbBean.executeQuery(sql);
                                                                                id = "";
                                                                                String jiudian = "";
                                                                                String kefangbianhao = "";
                                                                                String leixing = "";
                                                                                String daxiao = "";
                                                                                String jiage = "";
                                                                                beizhu = "";
                                                                                int i = 0;

                                                                                while (RS_result.next()) {
                                                                                    i = i + 1;
                                                                                    id = RS_result.getString("id");
                                                                                    jiudian = RS_result.getString("jiudian");
                                                                                    kefangbianhao = RS_result.getString("kefangbianhao");
                                                                                    leixing = RS_result.getString("leixing");
                                                                                    daxiao = RS_result.getString("daxiao");
                                                                                    jiage = RS_result.getString("jiage");
                                                                                    beizhu = RS_result.getString("beizhu");
                                                                                    String jiudianEncode = URLEncoder.encode(jiudian, "UTF-8");
                                                                            %>
                                                                            <tr>
                                                                                <td width="30" align="center"><%=i %>
                                                                                </td>
                                                                                <td><%=jiudian %>
                                                                                </td>
                                                                                <td><%=kefangbianhao %>
                                                                                </td>
                                                                                <td><%=leixing %>
                                                                                </td>
                                                                                <td><%=daxiao %>
                                                                                </td>
                                                                                <td><%=jiage %>
                                                                                </td>
                                                                                <td><%=beizhu %>
                                                                                </td>
                                                                                <td width="60" align="center"><a
                                                                                        href="jiudianyudingadd.jsp?jd=<%=jiudianEncode%>&kfbh=<%=kefangbianhao%>&jg=<%=jiage%>">Book</a><a
                                                                                        href="del.jsp?id=<%=id %>&tablename=kefang"
                                                                                        onClick="return confirm('Really want to delete?')"></a>
                                                                                </td>
                                                                            </tr>
                                                                            <%
                                                                                }
                                                                            %>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" align="center"><input type="button"
                                                                                                          name="Submit5"
                                                                                                          value="Back"
                                                                                                          onClick="javascript:history.back()"/>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <p align="center">&nbsp;</p>
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
    <tr>
        <td>
            <%@ include file="qtdown.jsp" %>
        </td>
    </tr>
</table>
</body>
</html>
