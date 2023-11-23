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
    <LINK href="CSS.css" type=text/css rel=stylesheet>
    <script language="javascript" src="js/Calendar.js"></script>
    <script type="text/javascript" src="js/popup.js"></script>
    <script type="text/javascript">
        function up(tt) {
            var pop = new Popup({contentType: 1, isReloadOnClose: false, width: 300, height: 50});
            pop.setContent("contentUrl", "upload.jsp?Result=" + tt);
            pop.setContent("title", "File Upload");
            pop.build();
            pop.show();
        }
    </script>
</head>
<script language="javascript">
    function check() {
        if (document.form1.mingcheng.value == "") {
            alert("Please enter the name");
            document.form1.mingcheng.focus();
            return false;
        }
        if (document.form1.xingji.value == "") {
            alert("Please enter the star rating");
            document.form1.xingji.focus();
            return false;
        }
    }

    function gow() {
        document.location.href = "jingdianxinxi_add.jsp?jihuabifffanhao=" + document.form1.jihuabifffanhao.value;
    }
</script>
<body>
<form name="form1" id="form1" method="post" action="/jingdianxinxi_add_post">
    Add Scenic Spot Information:
    <br><br>
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="green"
           style="border-collapse:collapse">
        <tr>
            <td>Name:</td>
            <td><input name='mingcheng' type='text' id='mingcheng' value='' size='50'/>&nbsp;*</td>
        </tr>
        <tr>
            <td>Star Rating:</td>
            <td><select name='xingji' id='xingji'>
                <option value="One Star">One Star</option>
                <option value="Two Stars">Two Stars</option>
                <option value="Three Stars">Three Stars</option>
                <option value="Four Stars">Four Stars</option>
                <option value="Five Stars">Five Stars</option>
            </select>&nbsp;*
            </td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input name='dizhi' type='text' id='dizhi' value='' size='50'/></td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><input name='dianhua' type='text' id='dianhua' value=''/></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><textarea name='jianjie' cols='50' rows='5' id='jianjie'></textarea></td>
        </tr>
        <tr>
            <td>Photo:</td>
            <td><input name='zhaopian' type='text' id='zhaopian' size='50' value=''/>&nbsp;<input type='button'
                                                                                                  value='Upload'
                                                                                                  onClick="up('zhaopian')"/>
            </td>
        </tr>
        <tr>
            <td>Ticket Price:</td>
            <td><input name='piaojia' type='text' id='piaojia' value=''/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="Submit" onClick="return check();"/>
                <input type="reset" name="Submit2" value="Reset"/></td>
        </tr>
    </table>
</form>

</body>
</html>

