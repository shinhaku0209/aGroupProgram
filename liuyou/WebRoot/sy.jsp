<%@ page language="java" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    System.out.println(basePath);
%>

<html>
<head>
    <base href="<%=basePath%>">

    <title>�û���¼</title>
</head>

<body>
<p class="welcome">&nbsp;</p>
</body>
</html>

