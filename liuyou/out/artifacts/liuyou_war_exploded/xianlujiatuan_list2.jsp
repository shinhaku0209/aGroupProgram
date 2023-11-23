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
    <title>Route Joining Group</title>
    <LINK href="CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
</head>
<%
    String sql;
    ResultSet RS_result;
%>
<body>
<p>Existing Route Joining Group List:</p>
<form name="form1" id="form1" method="post" action="">
    Search: Route Number:
    <input name="routeNumber" type="text" id="routeNumber"/>
    Route Name:
    <input name="routeName" type="text" id="routeName"/>
    Departure Place:
    <input name="departurePlace" type="text" id="departurePlace"/>
    Destination:
    <input name="destination" type="text" id="destination"/>
    Transportation:
    <input name="transportation" type="text" id="transportation"/>
    Publisher:
    <input name="publisher" type="text" id="publisher"/>
    Participants:
    <input name="participants" type="text" id="participants"/>
    <input type="submit" name="Submit" value="Search"/>
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
       style="border-collapse:collapse">
    <tr>
        <td width="30" align="center" bgcolor="CCFFFF">Number</td>
        <td bgcolor='#CCFFFF'>Route Number</td>
        <td bgcolor='#CCFFFF'>Route Name</td>
        <td bgcolor='#CCFFFF'>Departure Place</td>
        <td bgcolor='#CCFFFF'>Destination</td>
        <td bgcolor='#CCFFFF'>Transportation</td>
        <td bgcolor='#CCFFFF'>Cost</td>
        <td bgcolor='#CCFFFF'>Departure Time</td>
        <td bgcolor='#CCFFFF'>Publisher</td>
        <td bgcolor='#CCFFFF'>Participants</td>
        <td bgcolor='#CCFFFF'>Remarks</td>
        <td bgcolor='#CCFFFF' width='80' align='center'>Approval Status</td>
        <td width="138" align="center" bgcolor="CCFFFF">Add Time</td>
        <td width="60" align="center" bgcolor="CCFFFF">Action</td>
    </tr>
    <%
        int curpage = 1;//��ǰҳ
        int page_record = 10;//ÿҳ��ʾ�ļ�¼��
        int zgs = 0;
        int zys = 0;
        //������ķ�����sql��ѯ��ɣ��ٶȿ죩
        String hsgnpage = request.getParameter("page");
        String fysql = "select count(id) as ss from xianlujiatuan where canjiaren='" + request.getSession().getAttribute("username") + "'";
        ResultSet RS_resultfy = connDbBean.executeQuery(fysql);
        while (RS_resultfy.next()) {
            zgs = Integer.parseInt(RS_resultfy.getString("ss"));
            zys = zgs / page_record + 1;
        }
        if (hsgnpage != null) {
            curpage = Integer.parseInt(request.getParameter("page"));//��ȡ���ݵ�ֵ����Ҫ��ʾ��ҳ
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
        sql = "select  * from xianlujiatuan where canjiaren='" + request.getSession().getAttribute("username") + "' and 1=1";

        if (request.getParameter("xianlubianhao") == "" || request.getParameter("xianlubianhao") == null) {
        } else {
            sql = sql + " and xianlubianhao like '%" + new String(request.getParameter("xianlubianhao").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("xianlumingcheng") == "" || request.getParameter("xianlumingcheng") == null) {
        } else {
            sql = sql + " and xianlumingcheng like '%" + new String(request.getParameter("xianlumingcheng").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("chufadi") == "" || request.getParameter("chufadi") == null) {
        } else {
            sql = sql + " and chufadi like '%" + new String(request.getParameter("chufadi").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("mudedi") == "" || request.getParameter("mudedi") == null) {
        } else {
            sql = sql + " and mudedi like '%" + new String(request.getParameter("mudedi").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("jiaotonggongju") == "" || request.getParameter("jiaotonggongju") == null) {
        } else {
            sql = sql + " and jiaotonggongju like '%" + new String(request.getParameter("jiaotonggongju").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("faburen") == "" || request.getParameter("faburen") == null) {
        } else {
            sql = sql + " and faburen like '%" + new String(request.getParameter("faburen").getBytes("8859_1")) + "%'";
        }
        if (request.getParameter("canjiaren") == "" || request.getParameter("canjiaren") == null) {
        } else {
            sql = sql + " and canjiaren like '%" + new String(request.getParameter("canjiaren").getBytes("8859_1")) + "%'";
        }
        sql = sql + "  order by id desc  limit " + curpage2 + "," + page_record;
        RS_result = connDbBean.executeQuery(sql);
        String id = "";
        String xianlubianhao = "";
        String xianlumingcheng = "";
        String chufadi = "";
        String mudedi = "";
        String jiaotonggongju = "";
        String feiyong = "";
        String chuxingshijian = "";
        String faburen = "";
        String canjiaren = "";
        String beizhu = "";
        String issh = "";
        String addtime = "";
        int i = 0;


        while (RS_result.next()) {
            i = i + 1;
            id = RS_result.getString("id");
            xianlubianhao = RS_result.getString("xianlubianhao");
            xianlumingcheng = RS_result.getString("xianlumingcheng");
            chufadi = RS_result.getString("chufadi");
            mudedi = RS_result.getString("mudedi");
            jiaotonggongju = RS_result.getString("jiaotonggongju");
            feiyong = RS_result.getString("feiyong");
            chuxingshijian = RS_result.getString("chuxingshijian");
            faburen = RS_result.getString("faburen");
            canjiaren = RS_result.getString("canjiaren");
            beizhu = RS_result.getString("beizhu");
            issh = RS_result.getString("issh");
            addtime = RS_result.getString("addtime");


    %>
    <tr>
        <td width="30" align="center"><%=i %>
        </td>
        <td><%=xianlubianhao %>
        </td>
        <td><%=xianlumingcheng %>
        </td>
        <td><%=chufadi %>
        </td>
        <td><%=mudedi %>
        </td>
        <td><%=jiaotonggongju %>
        </td>
        <td><%=feiyong %>
        </td>
        <td><%=chuxingshijian %>
        </td>
        <td><%=faburen %>
        </td>
        <td><%=canjiaren %>
        </td>
        <td><%=beizhu %>
        </td>
        <td width='80' align='center'><%=issh%>
        </td>
        <td width="138" align="center"><%=addtime %>
        </td>
        <td width="60" align="center"><a href="xianlujiatuan_updt.jsp?id=<%=id%>">Modify</a>
            <a href="del.jsp?id=<%=id %>&tablename=routejoininggroup"
               onclick="return confirm('Really delete?')">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
<br>
Above data total <%=i %> records,
<a style="cursor:hand" onclick="javascript:window.print();">Print this page</a>
<p align="center">&nbsp;Total <%=zgs %> records&nbsp;&nbsp;<%=page_record %> records/page
    <a href="xianlujiatuan_list2.jsp?page=1">First</a>
    <a href="xianlujiatuan_list2.jsp?page=<%= curpage-1%>">Previous</a>
    <A href="xianlujiatuan_list2.jsp?page=<%= curpage+1%>">Next</A>
    <a href="xianlujiatuan_list2.jsp?page=<%=zys %>">Last</A> Current Page<FONT color=red><%=curpage %>
    </FONT>/Total<FONT color=red><%=zys %>
    </FONT> Pages</p>
</body>
</html>
