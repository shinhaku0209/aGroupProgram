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

    <title>Scenic Spot Information</title>
    <LINK href="CSS.css" type=text/css
          rel=stylesheet>
</head>

<body>
<p>Existing Scenic Spot Information List:</p>
<form name="form1" id="form1" method="post" action="">
    Search: Name:
    <input name="bianhao" type="text" id="bianhao"/>
    Star Rating:
    <input name="mingcheng" type="text" id="mingcheng"/>
    <input type="submit" name="Submit" value="Search"/>
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="green"
       style="border-collapse:collapse">
    <tr>
        <td width="30" align="center">Serial Number</td>
        <td>Name</td>
        <td>Star Rating</td>
        <td>Address</td>
        <td>Phone</td>
        <td>Introduction</td>
        <td>Photo</td>
        <td>Ticket Price</td>
        <td width="138" align="center">Add Time</td>
        <td width="60" align="center">Operation</td>
    </tr>
    <%
        String sql = "";
        sql = "select * from jingdianxinxi where 1=1";
        if (request.getParameter("bianhao") == "" || request.getParameter("bianhao") == null) {
        } else {
            sql = sql + " and mingcheng like '%" + new String(request.getParameter("bianhao").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("mingcheng") == "" || request.getParameter("mingcheng") == null) {
        } else {
            sql = sql + " and xingji like '%" + new String(request.getParameter("mingcheng").getBytes("8859_1")) + "%'";
        }
        sql = sql + " order by id desc";
        ResultSet RS_result = connDbBean.executeQuery(sql);
        String id = "";
        String mingcheng = "";
        String xingji = "";
        String dizhi = "";
        String dianhua = "";
        String jianjie = "";
        String zhaopian = "";
        String piaojia = "";
        String addtime = "";
        int i = 0;

        while (RS_result.next()) {
            i = i + 1;
            id = RS_result.getString("id");
            mingcheng = RS_result.getString("mingcheng");
            xingji = RS_result.getString("xingji");
            dizhi = RS_result.getString("dizhi");
            dianhua = RS_result.getString("dianhua");
            jianjie = RS_result.getString("jianjie");
            zhaopian = RS_result.getString("zhaopian");
            piaojia = RS_result.getString("piaojia");
            addtime = RS_result.getString("addtime");
    %>
    <tr>
        <td width="30" align="center"><%=i %>
        </td>
        <td><%=mingcheng %>
        </td>
        <td><%=xingji %>
        </td>
        <td><%=dizhi %>
        </td>
        <td><%=dianhua %>
        </td>
        <td><%=jianjie %>
        </td>
        <td><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0/></a></td>
        <td><%=piaojia %>
        </td>
        <td width="138" align="center"><%=addtime %>
        </td>
        <td width="60" align="center"><a href="/jingdianxinxi_updt.jsp?id=<%=id%>">Modify</a> <a
                href="del.jsp?id=<%=id %>&tablename=jingdianxinxi"
                onClick="return confirm('Do you really want to delete?')">Delete</a></td>
    </tr>
    <% } %>
</table>
<br>
Total <%=i %> records, <a style="cursor:hand" onClick="javascript:window.print();">Print this page</a>
</body>
</html>
