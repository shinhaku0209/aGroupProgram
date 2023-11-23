<%
    if (request.getSession().getAttribute("cx").equals("admin")) {

    } else {
        out.print("<script>alert('Sorry, you do not have the permission for this action!');history.back();</script>");
    }
%>
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

    <title>Change Password</title>


</head>

<body>
<form name="form1" id="form1" method="post" action="yhzhgl_post.jsp">
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
           style="border-collapse:collapse">
        <tr>
            <td>Username:</td>
            <td><input name="username" type="text" id="username"/>
                *
            </td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input name="pwd1" type="password" id="pwd1"/>
                *
            </td>
        </tr>
        <tr>
            <td>Confirm Password:</td>
            <td><input name="pwd2" type="password" id="pwd2"/>
                *
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="Submit" onclick="return check();"/>
                <input type="reset" name="Submit2" value="Reset"/></td>
        </tr>
    </table>
</form>
<p>List of existing administrators:</p>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
       style="border-collapse:collapse">
    <tr>
        <td bgcolor="A4B6D7">Number</td>
        <td bgcolor="A4B6D7">Username</td>
        <td bgcolor="A4B6D7">Password</td>
        <td bgcolor="A4B6D7">Permission</td>
        <td bgcolor="A4B6D7">Add Time</td>
        <td bgcolor="A4B6D7">Operation</td>
    </tr>
    <%
        ResultSet RS_result = connDbBean.executeQuery("select * from allusers order by id desc");
        String id = "";
        String username = "";
        String pwd = "";
        String cx = "";
        String addtime = "";
        int i = 0;


        while (RS_result.next()) {
            i = i + 1;
            id = RS_result.getString("id");
            username = RS_result.getString("username");
            pwd = RS_result.getString("pwd");
            cx = RS_result.getString("cx");
            addtime = RS_result.getString("addtime");


    %>
    <tr>
        <td><%=i %>
        </td>
        <td><%=username %>
        </td>
        <td><%=pwd %>
        </td>
        <td><%=cx %>
        </td>
        <td><%=addtime %>
        </td>
        <td><a href="del.jsp?id=<%=id %>&tablename=allusers"
               onclick="return confirm('Are you sure you want to delete?')">Delete</a></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
