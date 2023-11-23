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

    <title>Self-Driving Tour Routes</title>
    <LINK href="CSS.css" type=text/css rel=stylesheet>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/lightbox.css">
    <script src="js/jquery-1.11.1.min.js"></script>
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
        if (document.form1.xianlubianhao.value == "") {
            alert("Please enter the route number");
            document.form1.xianlubianhao.focus();
            return false;
        }
        if (document.form1.xianlumingcheng.value == "") {
            alert("Please enter the route name");
            document.form1.xianlumingcheng.focus();
            return false;
        }
        if (document.form1.faburen.value == "") {
            alert("Please enter the publisher");
            document.form1.faburen.focus();
            return false;
        }
    }

    function gow() {
        document.location.href = "zijiayouxianlu_add.jsp?jihuabifffanhao=" + document.form1.jihuabifffanhao.value;
    }
</script>
<body>
<form name="formlog" id="form1" method="post" action="/ZiJiaYouXianLuAddPost">
    Add Self-Driving Tour Route:
    <br><br>
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="green"
           style="border-collapse:collapse">
        <tr>
            <td>Route Number:</td>
            <td><input name='xianlubianhao' type='text' id='xianlubianhao' value=''/>&nbsp;*</td>
        </tr>
        <tr>
            <td>Route Name:</td>
            <td><input name='xianlumingcheng' type='text' id='xianlumingcheng' value='' size='50'/>&nbsp;*</td>
        </tr>
        <tr>
            <td>Departure:</td>
            <td><input name='chufadi' type='text' id='chufadi' value=''/></td>
        </tr>
        <tr>
            <td>Destination:</td>
            <td><input name='mudedi' type='text' id='mudedi' value=''/></td>
        </tr>
        <tr>
            <td>Transportation:</td>
            <td><select name='jiaotonggongju' id='jiaotonggongju'>
                <option value="Train">Train</option>
                <option value="Bus">Bus</option>
                <option value="Airplane">Airplane</option>
                <option value="Ship">Ship</option>
                <option value="Walking">Walking</option>
                <option value="Bicycle">Bicycle</option>
            </select></td>
        </tr>
        <tr>
            <td>Cost:</td>
            <td><input name='feiyong' type='text' id='feiyong' value=''/></td>
        </tr>
        <tr>
            <td>Travel Time:</td>
            <td><input name='chuxingshijian' type='text' id='chuxingshijian' value=''
                       onClick="getDate(document.form1.chuxingshijian,'2')" need='1'/></td>
        </tr>
        <tr>
            <td>Remarks:</td>
            <td><textarea name='beizhu' cols='50' rows='5' id='beizhu'></textarea></td>
        </tr>
        <tr>
            <td>Publisher:</td>
            <td><input name='faburen' type='text' id='faburen'
                       value='<%=request.getSession().getAttribute("username")%>'/>&nbsp;*
            </td>
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
