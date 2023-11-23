<%@ page language="java" contentType="text/html; charset=gb2312"
         pageEncoding="gb2312" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>Insert title here</title>


    <META content="MSHTML 6.00.2800.1106" name=GENERATOR>

</HEAD>


<table id="__01" width="978" height="119" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><img src="qtimages/1_03_01.jpg" width="978" height="19" alt=""></td>
    </tr>
    <tr>
        <td width="978" height="72">
            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center"><%
                        java.util.Date date = new java.util.Date();
                        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.CHINA);

                        String result = format.format(date);
                        out.print(result);
                    %></td>
                </tr>
            </table>
</table>