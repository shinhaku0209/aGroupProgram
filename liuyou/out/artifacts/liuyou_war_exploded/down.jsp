<%@ page language="java" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
<head>


    <title></title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }

        .STYLE1 {
            color: #43860c;
            font-size: 12px;
        }

        -->
    </style>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="24" background="images/main_47.gif">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="29" height="24"><img src="images/main_45.gif" width="29" height="24"/></td>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="814" class="STYLE1">User:<%=request.getSession().getAttribute("username") %>&nbsp;&nbsp;Character:<%=request.getSession().getAttribute("cx") %>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="14"><img src="images/main_49.gif" width="14" height="24"/></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>

