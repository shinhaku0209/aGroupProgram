<%@ page language="java" contentType="text/html; charset=gb2312"
         pageEncoding="gb2312" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>Insert title here</title>


    <META content="MSHTML 6.00.2800.1106" name=GENERATOR>

    <style type="text/css">
        <!--
        .STYLE7 {
            color: #FF33FF;
            font-size: 30pt;
        }

        -->
        a {
            text-decoration: none;
        }

        span {
            margin: 0 auto;
        }

    </style>
</HEAD>
<body>
<!---<img src="qtimages/title.jpg" height="180px" width="1200px" >--->
<table width="978" height="140" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
    <tr>
          <span class="STYLE4">user:<%=request.getSession().getAttribute("username")%> 您的权限：<%=request.getSession().getAttribute("cx")%>
              <input type="button" name="Submit3" value="exit" onClick="javascript:location.href='/logout';"
                     style=" height:19px; border:solid 1px #000000; color:#666666">
              <input type="button" name="Submit32" value="manager" onClick="javascript:location.href='main.jsp';"
                     style=" height:19px; border:solid 1px #000000; color:#666666">
    </tr>
    <tr>
        <td width="978" height="31">
            <table background="qtimages/landi.jpg" width="98%" border="0" align="center" cellpadding="0"
                   cellspacing="0">
                <tr>
                    <!---<td align="center"><a href="index.html"><span class="STYLE5">home</span></a></td>-->
                    <td align="center" class="red"><a href="jiudianxinxilist.jsp"><span
                            class="STYLE5"><strong>hotel</strong></span></a></td>
                    <td align="center" class="red"><a href="jingdianxinxilist.jsp"><span class="STYLE5"><strong>travel scenic spot</strong></span></a>
                    </td>
                    <td align="center" class="red"><a href="zijiayouxianlulist.jsp"><span
                            class="STYLE5"><strong>route</strong></span></a></td>
                    <!--      <td align="center" class="red"><a href="tianqiyubao.jsp"><span class="STYLE5"><strong>天气预报</strong></span></a></td> -->
                    <!---<td align="center" class="red"><a href="login.jsp"><span class="STYLE5"><strong>后台管理</strong></span></a></td> --->
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
