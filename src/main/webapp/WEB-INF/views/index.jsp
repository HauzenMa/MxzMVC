<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程介绍</title>
<style type="text/css">
table.gridtable {
	font-family: verdana, arial, sans-serif;
	font-size: 25px;
	font-color: #ffffff;
	color: #ff8040;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
	width: 500px;
	text-align: center;
	margin-top: 30px;
	margin-bottom: 30px;
}

table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: collapse;
}

table.gridtable td {
	border-width: 1px;
	padding: 3px;
	border-style: solid;
	border-color: #666666;
	background-color: collapse;
}
</style>
</head>
<body>
	<table align="center">
		<tr>
			<td align="center"><font size="20" color= #fde6a8>JavaWeb程序设计</font></td>
		</tr>
		<tr>
			<td align="center"><font size="5" color= #fde6a8>20160504073	马祥哲</font></td>
		</tr>
	</table>
	<table align="center" class="gridtable">
		<tr>
			<td>学生班级管理</td>
			<td><a href="${pageContext.request.contextPath}/grade/list" target="_blank">列表</a></td>
		</tr>
		<tr>
			<td>学生管理</td>
			<td><a href="${pageContext.request.contextPath}/student/list" target="_blank">列表</a></td>
		</tr>
		<tr>
			<td>资料下载</td>
			<td>
				<a href="${pageContext.request.contextPath}/login" target="_blank">登录</a>
			</td>
		</tr>
	</table>
	<table align="center">
		<tr>
			<td><font color= #fde6a8>现在时间是${serverTime}.</font></td>
		</tr>
	</table>
</body>
<body background="https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1547128509960&amp;di=cbb59c76b81949e0ca652ae1e086c535&amp;imgtype=0&amp;src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201510%2F17%2F20151017182423_VzY4R.jpeg"style=" background-size: cover;display: block;">
</html>
