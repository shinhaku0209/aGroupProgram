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
    <title>User Registration</title>
    <LINK href="CSS.css" type=text/css rel=stylesheet>
</head>
<body>
<p>Existing User Registration List:</p>
<form name="form1" id="form1" method="post" action="">
    Search: Username: <input name="yonghuming" type="text" id="yonghuming"/> Name: <input name="xingming" type="text"
                                                                                          id="xingming"/> QQ: <input
        name="QQ" type="text" id="QQ"/> Email: <input name="youxiang" type="text" id="youxiang"/> Phone: <input
        name="dianhua" type="text" id="dianhua"/> ID Card: <input name="shenfenzheng" type="text" id="shenfenzheng"/>
    <input type="submit" name="Submit" value="Search"/>
</form>
<table bordercolor="green" style="border-collapse:collapse">
    <tr>
        <td width="30" align="center">Number</td>
        <td>Username</td>
        <td>Password</td>
        <td>Name</td>
        <td>Gender</td>
        <td>Date of Birth</td>
        <td>QQ</td>
        <td>Email</td>
        <td>Phone</td>
        <td>ID Card</td>
        <td>Profile Picture</td>
        <td>Address</td>
        <td>Remarks</td>
        <td width="138" align="center">Add Time</td>

        <td width="60" align="center">Approval</td>
        <td width="60" align="center">Operation</td>
    </tr>
    <%
        int curpage = 1;//current page
        int page_record = 10;//records per page
        int zgs = 0;
        int zys = 0;
        // Using the following method (sql query completed, fast speed)
        String hsgnpage = request.getParameter("page");
        String fysql = "select count(id) as ss from yonghuzhuce";
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
        String sql = "";
        // id not in (select top "+((curpage-1)*page_record)+" id from yonghuzhuce order by id desc)
        sql = "select  * from yonghuzhuce where 1=1  ";
        int curpage2 = curpage - 1;
        if (request.getParameter("yonghuming") == "" || request.getParameter("yonghuming") == null) {
        } else {
            sql = sql + " and yonghuming like '%" + new String(request.getParameter("yonghuming").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("xingming") == "" || request.getParameter("xingming") == null) {
        } else {
            sql = sql + " and xingming like '%" + new String(request.getParameter("xingming").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("QQ") == "" || request.getParameter("QQ") == null) {
        } else {
            sql = sql + " and QQ like '%" + new String(request.getParameter("QQ").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("youxiang") == "" || request.getParameter("youxiang") == null) {
        } else {
            sql = sql + " and youxiang like '%" + new String(request.getParameter("youxiang").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("dianhua") == "" || request.getParameter("dianhua") == null) {
        } else {
            sql = sql + " and dianhua like '%" + new String(request.getParameter("dianhua").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("shenfenzheng") == "" || request.getParameter("shenfenzheng") == null) {
        } else {
            sql = sql + " and shenfenzheng like '%" + new String(request.getParameter("shenfenzheng").getBytes("8859_1")) + "%'";
        }
        sql = sql + " order by id desc limit " + curpage2 + "," + page_record;
        ResultSet RS_result = connDbBean.executeQuery(sql);
        String id = "";
        String yonghuming = "";
        String mima = "";
        String xingming = "";
        String xingbie = "";
        String chushengnianyue = "";
        String QQ = "";
        String youxiang = "";
        String dianhua = "";
        String shenfenzheng = "";
        String touxiang = "";
        String dizhi = "";
        String beizhu = "";
        String addtime = "";
        String issh = "";
        int i = 0;
        while (RS_result.next()) {
            i = i + 1;
            id = RS_result.getString("id");
            yonghuming = RS_result.getString("yonghuming");
            mima = RS_result.getString("mima");
            xingming = RS_result.getString("xingming");
            xingbie = RS_result.getString("xingbie");
            chushengnianyue = RS_result.getString("chushengnianyue");
            QQ = RS_result.getString("QQ");
            youxiang = RS_result.getString("youxiang");
            dianhua = RS_result.getString("dianhua");
            shenfenzheng = RS_result.getString("shenfenzheng");
            touxiang = RS_result.getString("touxiang");
            dizhi = RS_result.getString("dizhi");
            beizhu = RS_result.getString("beizhu");
            addtime = RS_result.getString("addtime");
            issh = RS_result.getString("issh");
    %>
    <tr>
        <td width="30" align="center"><%=i %>
        </td>
        <td><%=yonghuming %>
        </td>
        <td><%=mima %>
        </td>
        <td><%=xingming %>
        </td>
        <td><%=xingbie %>
        </td>
        <td><%=chushengnianyue %>
        </td>
        <td><%=QQ %>
        </td>
        <td><%=youxiang %>
        </td>
        <td><%=dianhua %>
        </td>
        <td><%=shenfenzheng %>
        </td>
        <td><a href='<%=touxiang %>' target='_blank'><img src='<%=touxiang %>' width=88 height=99 border=0/></a></td>
        <td><%=dizhi %>
        </td>
        <td><%=beizhu %>
        </td>
        <td width="138" align="center"><%=addtime %>
        </td>
        <td width="90" align="center"><a href="approve.jsp?id=<%=id%>&origin=<%=issh%>&tablename=yonghuzhuce"
                                         onClick="return confirm('Are you sure you want to perform this operation?');"><%=issh%>
        </a></td>
        <td><a href="del.jsp?id=<%=id %>&tablename=yonghuzhuce"
               onClick="return confirm('Do you really want to delete?')">Delete</a> <a
                href="yonghuzhuce_details.jsp?id=<%=id%>" target="_blank"></a></td>
    </tr>
    <%
        }
    %>
</table>
<br>
The above data has a total of <%=i %> records, <a style="cursor:hand" onClick="javascript:window.print();">Print this
    page</a>
<p align="center">&nbsp;Total <%=zgs%> records&nbsp;&nbsp;<%=page_record %> records/page　<a
        href="yonghuzhuce_list.jsp?page=1">First Page</a>　<a href="yonghuzhuce_list.jsp?page=<%= curpage-1%>">Previous
    Page</a>　<A href="yonghuzhuce_list.jsp?page=<%= curpage+1%>">Next Page</A>　<a
        href="yonghuzhuce_list.jsp?page=<%=zys %>">Last Page</A>　Current page <FONT color=red><%=curpage %>
</FONT>/Total <FONT color=red><%=zys %>
</FONT> pages</p>
</body>
</html>
