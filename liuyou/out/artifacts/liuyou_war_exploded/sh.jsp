<%@ page language="java" pageEncoding="gb2312" import="java.sql.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'adminyanzheng.jsp' starting page</title>
</head>
<body>
<%
    String yuan = new String(request.getParameter("yuan").getBytes("8859_1"));
    String id = request.getParameter("id");
    String tablename = request.getParameter("tablename");
    String sql = "";
    if (yuan.equals("ÊÇ")) {
        sql = "update " + tablename + " set issh='no' where id=" + id;
    } else {
        sql = "update " + tablename + " set issh='yes' where id=" + id;
    }
    connDbBean.executeUpdate(sql);
    out.print("<script>alert('Successful!!');location.href='" + request.getHeader("Referer") + "';</script>");
%>
</body>
</html>


