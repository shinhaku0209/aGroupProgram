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
    <base href="<%=basePath%>">
    <title>Hotel Information</title>
    <LINK href="CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
</head>
<%
    String sql;
    ResultSet RS_result;
%>
<body>
<p>Existing Hotel Information List:</p>
<form name="form1" id="form1" method="post" action="">
    Search: ID£º<input name="bianhao" type="text" id="bianhao"/>
    Name£º<input name="mingcheng" type="text" id="mingcheng"/>
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
    <input name="dianhua" type="text" id="dianhua"/>
    <input type="submit" name="Submit" value="Search"/>
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF"
       style="border-collapse:collapse">
    <tr>
        <td width="30" align="center" bgcolor="CCFFFF">Serial Number</td>
        <td bgcolor='#CCFFFF'>ID</td>
        <td bgcolor='#CCFFFF'>Name</td>
        <td bgcolor='#CCFFFF'>Star Rating</td>
        <td bgcolor='#CCFFFF'>Address</td>
        <td bgcolor='#CCFFFF'>Phone</td>
        <td bgcolor='#CCFFFF' width='90' align='center'>Photo</td>
        <td bgcolor='#CCFFFF'>Remarks</td>
        <td width="138" align="center" bgcolor="CCFFFF">Add Time</td>
        <td width="60" align="center" bgcolor="CCFFFF">Room Management</td>
        <td width="60" align="center" bgcolor="CCFFFF">Operations</td>
    </tr>
    <%
        int curpage = 1; // Current page
        int page_record = 10; // Records per page
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
            curpage = Integer.parseInt(request.getParameter("page")); // Get the page to display
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
        sql = "select * from jiudianxinxi where 1=1 ";

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
            String mingchengEncode = URLEncoder.encode(mingcheng, "UTF-8");
    %>
    <tr>
        <td width="30" align="center"><%=i %>
        </td>
        <td><%=bianhao %>
        </td>
        <td><%=mingcheng %>
        </td>
        <td><%=xingji %>
        </td>
        <td><%=dizhi %>
        </td>
        <td><%=dianhua %>
        </td>
        <td width='90'><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0/></a>
        </td>
        <td><%=beizhu %>
        </td>
        <td width="138" align="center"><%=addtime %>
        </td>
        <td width="90" align="center"><a href="kefang_list.jsp?jd=<%=mingchengEncode%>">Room Management</a></td>
        <td width="90" align="center"><a href="jiudianxinxi_updt.jsp?id=<%=id%>">Edit</a> <a
                href="del.jsp?id=<%=id %>&tablename=jiudianxinxi"
                onClick="return confirm('Are you sure you want to delete?')">Delete</a> <a
                href="jiudianxinxidetail.jsp?id=<%=id%>" target="_blank">Details</a></td>
    </tr>
    <%
        }
    %>
</table>
<br>
Total <%=i %> records, <a style="cursor:hand" onClick="javascript:window.print();">Print this page</a>
<p align="center">&nbsp;Total <%=zgs%> records&nbsp;&nbsp;<%=page_record %> records/page <a
        href="jiudianxinxi_list.jsp?page=1">First</a> <a href="jiudianxinxi_list.jsp?page=<%= curpage-1%>">Previous</a>
    <A href="jiudianxinxi_list.jsp?page=<%= curpage+1%>">Next</A> <a
            href="jiudianxinxi_list.jsp?page=<%=zys %>">Last</A> Current Page <FONT color=red><%=curpage %>
    </FONT>/Total Pages <FONT color=red><%=zys %>
    </FONT></p>
</body>
</html>
