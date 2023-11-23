<%@ page language="java" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Hotel Reservation</title>
    <LINK href="CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
</head>
<%
    String sql;
    ResultSet RS_result;
%>
<body>
<p>Existing Hotel Reservations:</p>
<form name="form1" id="form1" method="post" action="">
    Hotel Name:
    <input name="jiudianmingcheng" type="text" id="jiudianmingcheng"/>
    Room Number:
    <input name="kefangbianhao" type="text" id="kefangbianhao"/>
    Name:
    <input name="nindexingming" type="text" id="nindexingming" size="10"/>
    Phone:
    <input name="nindedianhua" type="text" id="nindedianhua" size="15"/>
    ID Card:
    <input name="nindeshenfenzheng" type="text" id="nindeshenfenzheng"/>
    Username:
    <input name="yonghuming" type="text" id="yonghuming" size="12"/>
    <input type="submit" name="Submit" value="Search"/>
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF"
       style="border-collapse:collapse">
    <tr>
        <td width="30" align="center" bgcolor="CCFFFF">Number</td>
        <td bgcolor='#CCFFFF'>Hotel Name</td>
        <td bgcolor='#CCFFFF'>Room Number</td>
        <td bgcolor='#CCFFFF'>Price</td>
        <td bgcolor='#CCFFFF' width='65' align='center'>Reservation Time</td>
        <td bgcolor='#CCFFFF'>Reservation Days</td>
        <td bgcolor='#CCFFFF'>Your Name</td>
        <td bgcolor='#CCFFFF'>Your Phone</td>
        <td bgcolor='#CCFFFF'>Your ID Card</td>
        <td bgcolor='#CCFFFF'>Remarks</td>
        <td bgcolor='#CCFFFF'>Username</td>
        <td bgcolor='#CCFFFF' width='80' align='center'>Is Verified</td>
        <td width="138" align="center" bgcolor="CCFFFF">Add Time</td>

        <td width="60" align="center" bgcolor="CCFFFF">Operation</td>
    </tr>
    <%
        int curpage = 1; // Current page
        int page_record = 10; // Records per page
        int zgs = 0;
        int zys = 0;

        String hsgnpage = request.getParameter("page");
        String fysql = "select count(id) as ss from jiudianyuding";
        ResultSet RS_resultfy = connDbBean.executeQuery(fysql);
        while (RS_resultfy.next()) {
            zgs = Integer.parseInt(RS_resultfy.getString("ss"));
            zys = zgs / page_record + 1;
        }

        if (hsgnpage != null) {
            curpage = Integer.parseInt(request.getParameter("page")); // Get the value to display the page
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
        sql = "select * from jiudianyuding where 1=1 ";

        if (request.getParameter("jiudianmingcheng") == "" || request.getParameter("jiudianmingcheng") == null) {
        } else {
            sql = sql + " and jiudianmingcheng like '%" + new String(request.getParameter("jiudianmingcheng").getBytes("8859_1")) + "%'";
        }

        if (request.getParameter("kefangbianhao") == "" || request.getParameter("kefangbianhao") == null) {
        } else {
            sql = sql + " and kefangbianhao like '%" + new String(request.getParameter("kefangbianhao").getBytes("8859_1")) + "%'";
        }

        if (request.getParameter("nindexingming") == "" || request.getParameter("nindexingming") == null) {
        } else {
            sql = sql + " and nindexingming like '%" + new String(request.getParameter("nindexingming").getBytes("8859_1")) + "%'";
        }

        if (request.getParameter("nindedianhua") == "" || request.getParameter("nindedianhua") == null) {
        } else {
            sql = sql + " and nindedianhua like '%" + new String(request.getParameter("nindedianhua").getBytes("8859_1")) + "%'";
        }

        if (request.getParameter("nindeshenfenzheng") == "" || request.getParameter("nindeshenfenzheng") == null) {
        } else {
            sql = sql + " and nindeshenfenzheng like '%" + new String(request.getParameter("nindeshenfenzheng").getBytes("8859_1")) + "%'";
        }

        if (request.getParameter("yonghuming") == "" || request.getParameter("yonghuming") == null) {
        } else {
            sql = sql + " and yonghuming like '%" + new String(request.getParameter("yonghuming").getBytes("8859_1")) + "%'";
        }

        sql = sql + " order by id desc limit " + curpage2 + "," + page_record;
        RS_result = connDbBean.executeQuery(sql);

        String id = "";
        String jiudianmingcheng = "";
        String kefangbianhao = "";
        String jiage = "";
        String yudingshijian = "";
        String yudingtianshu = "";
        String nindexingming = "";
        String nindedianhua = "";
        String nindeshenfenzheng = "";
        String beizhu = "";
        String yonghuming = "";
        String issh = "";
        String addtime = "";
        int i = 0;

        while (RS_result.next()) {
            i = i + 1;
            id = RS_result.getString("id");
            jiudianmingcheng = RS_result.getString("jiudianmingcheng");
            kefangbianhao = RS_result.getString("kefangbianhao");
            jiage = RS_result.getString("jiage");
            yudingshijian = RS_result.getString("yudingshijian");
            yudingtianshu = RS_result.getString("yudingtianshu");
            nindexingming = RS_result.getString("nindexingming");
            nindedianhua = RS_result.getString("nindedianhua");
            nindeshenfenzheng = RS_result.getString("nindeshenfenzheng");
            beizhu = RS_result.getString("beizhu");
            yonghuming = RS_result.getString("yonghuming");
            issh = RS_result.getString("issh");
            addtime = RS_result.getString("addtime");
    %>
    <tr>
        <td width="30" align="center"><%=i %>
        </td>
        <td><%=jiudianmingcheng %>
        </td>
        <td><%=kefangbianhao %>
        </td>
        <td><%=jiage %>
        </td>
        <td><%=yudingshijian %>
        </td>
        <td><%=yudingtianshu %>
        </td>
        <td><%=nindexingming %>
        </td>
        <td><%=nindedianhua %>
        </td>
        <td><%=nindeshenfenzheng %>
        </td>
        <td><%=beizhu %>
        </td>
        <td><%=yonghuming %>
        </td>
        <td width='80' align='center'><a href="sh.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=jiudianyuding"
                                         onClick="return confirm('Are you sure you want to perform this operation?')"><%=issh%>
        </a></td>
        <td width="138" align="center"><%=addtime %>
        </td>
        <td width="60" align="center"><a href="del.jsp?id=<%=id %>&tablename=jiudianyuding"
                                         onClick="return confirm('Do you really want to delete?')">Delete</a></td>
    </tr>
    <%
        }
    %>
</table>
<br>
The above data has <%=i %> entries,<a style="cursor:hand" onClick="javascript:window.print();">Print this page</a>
<p align="center">&nbsp;Total <%=zgs %> records&nbsp;&nbsp;<%=page_record %> records/page
    <a href="jiudianyuding_list.jsp?page=1">First</a>
    <a href="jiudianyuding_list.jsp?page=<%= curpage-1%>">Previous</a>
    <A href="jiudianyuding_list.jsp?page=<%= curpage+1%>">Next</A>
    <a href="jiudianyuding_list.jsp?page=<%=zys %>">Last</A>
    Currently on page <FONT color=red><%=curpage %>
    </FONT>/Total <FONT color=red><%=zys %>
    </FONT> pages</p>
</body>
</html>
