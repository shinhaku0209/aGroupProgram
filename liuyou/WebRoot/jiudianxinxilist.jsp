<%@ page language="java" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
    <title>North Village Tourism Website</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <LINK href="qtimages/style.css" type="text/css" rel="stylesheet">
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
    String sql;
    ResultSet RS_result;
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
                                                            <form name="form1" id="form1" method="post" action="">
                                                                Search: Number:
                                                                <input name="bianhao" type="text" id="bianhao"
                                                                       size="10"/>
                                                                Name:
                                                                <input name="mingcheng" type="text" id="mingcheng"
                                                                       size="10"/>
                                                                Star Rating:
                                                                <select name='xingji' id='xingji'>
                                                                    <option value="">All</option>
                                                                    <option value="1">1</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                </select>
                                                                Phone:
                                                                <input name="dianhua" type="text" id="dianhua"
                                                                       size="10"/>
                                                                <input type="submit" name="Submit5" value="Search"/>
                                                            </form>
                                                            <table width="100%" border="1" align="center"
                                                                   cellpadding="3" cellspacing="1" bordercolor="00FFFF"
                                                                   style="border-collapse:collapse">
                                                                <tr>
                                                                    <td width="51" align="center" bgcolor="CCFFFF">No.
                                                                    </td>
                                                                    <td width="99" bgcolor='#CCFFFF'>Number</td>
                                                                    <td width="137" bgcolor='#CCFFFF'>Name</td>
                                                                    <td width="49" bgcolor='#CCFFFF'>Star Rating</td>
                                                                    <td width="160" bgcolor='#CCFFFF'>Phone</td>
                                                                    <td bgcolor='#CCFFFF' width='101' align='center'>
                                                                        Photo
                                                                    </td>
                                                                    <td width="70" align="center" bgcolor="CCFFFF">
                                                                        Action
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                    int curpage = 1;//Current Page
                                                                    int page_record = 10;//Records per Page
                                                                    int zgs = 0;
                                                                    int zys = 0;
                                                                    String hsgnpage = request.getParameter("page");
                                                                    String fysql = "select count(id) as ss from jiudianxinxi";
                                                                    ResultSet RS_resultfy = connDbBean.executeQuery(fysql);
                                                                    while (RS_resultfy.next()) {
                                                                        zgs = Integer.parseInt(RS_resultfy.getString("ss"));
                                                                        zys = zgs / page_record + 1;
                                                                    }
                                                                    if (hsgnpage != null) {
                                                                        curpage = Integer.parseInt(request.getParameter("page"));//Get the value passed, the page to display
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
                                                                    sql = "select  * from jiudianxinxi where 1=1 ";

                                                                    if (request.getParameter("bianhao") == "" || request.getParameter("bianhao") == null) {
                                                                    } else {
                                                                        sql = sql + " and bianhao like '%" + new String(request.getParameter("bianhao").getBytes("8859_1")) + "%'";
                                                                    }
                                                                    if (request.getParameter("mingcheng") == "" || request.getParameter("mingcheng") == null) {
                                                                    } else {
                                                                        sql = sql + " and mingcheng like '%" + new String(request.getParameter("mingcheng").getBytes("8859_1")) + "%'";
                                                                    }
                                                                    if (request.getParameter("xingji") == "All" || request.getParameter("xingji") == null) {
                                                                    } else {
                                                                        sql = sql + " and xingji like '%" + new String(request.getParameter("xingji").getBytes("8859_1")) + "%'";
                                                                    }
                                                                    if (request.getParameter("dianhua") == "" || request.getParameter("dianhua") == null) {
                                                                    } else {
                                                                        sql = sql + " and dianhua like '%" + new String(request.getParameter("dianhua").getBytes("8859_1")) + "%'";
                                                                    }
                                                                    sql = sql + " order by id desc limit " + curpage2 + "," + page_record;
                                                                    RS_result = connDbBean.executeQuery(sql);
                                                                    String id = "";
                                                                    String bianhao = "";
                                                                    String mingcheng = "";
                                                                    String xingji = "";
                                                                    String dizhi = "";
                                                                    String dianhua = "";
                                                                    String zhaopian = "";
                                                                    String beizhu = "";
                                                                    String addtime = "";
                                                                    int i = 0;
                                                                    while (RS_result.next()) {
                                                                        i = i + 1;
                                                                        id = RS_result.getString("id");
                                                                        bianhao = RS_result.getString("bianhao");
                                                                        mingcheng = RS_result.getString("mingcheng");
                                                                        xingji = RS_result.getString("xingji");
                                                                        dizhi = RS_result.getString("dizhi");
                                                                        dianhua = RS_result.getString("dianhua");
                                                                        zhaopian = RS_result.getString("zhaopian");
                                                                        beizhu = RS_result.getString("beizhu");
                                                                        addtime = RS_result.getString("addtime");
                                                                %>
                                                                <tr>
                                                                    <td width="51" align="center"><%=i %>
                                                                    </td>
                                                                    <td><%=bianhao %>
                                                                    </td>
                                                                    <td><%=mingcheng %>
                                                                    </td>
                                                                    <td><%=xingji %>
                                                                    </td>
                                                                    <td><%=dianhua %>
                                                                    </td>
                                                                    <td width='101'><a href='<%=zhaopian %>'
                                                                                       target='_blank'><img
                                                                            src='<%=zhaopian %>' width=88 height=99
                                                                            border=0/></a></td>
                                                                    <td width="70" align="center"><a
                                                                            href="jiudianxinxidetail.jsp?id=<%=id%>">Details</a>
                                                                    </td>
                                                                </tr>
                                                                <%
                                                                    }
                                                                %>
                                                            </table>
                                                            <br>
                                                            The above data consists of <%=i %> entries. <a
                                                                style="cursor:hand"
                                                                onClick="javascript:window.print();">Print this page</a>
                                                            <p align="center">&nbsp;Total <%=zgs%>
                                                                records&nbsp;&nbsp;<%=page_record %> records/page　<a
                                                                        href="jiudianxinxilist.jsp?page=1">First</a>　<a
                                                                        href="jiudianxinxilist.jsp?page=<%= curpage-1%>">Previous</a>　<A
                                                                        href="jiudianxinxilist.jsp?page=<%= curpage+1%>">Next</A>　<a
                                                                        href="jiudianxinxilist.jsp?page=<%=zys %>">Last</A>　Current
                                                                Page <FONT color=red><%=curpage %>
                                                                </FONT>/Total <FONT color=red><%=zys %>
                                                                </FONT> pages</p>
                                                            <p align="center">&nbsp;</p>
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
