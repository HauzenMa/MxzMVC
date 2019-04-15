<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
<title>个人简历</title>
<style type="text/css">
@import url("<c:url value='/css/table.css'/>");
</style>
</head>
<body >
	<h1>个人简历</h1>
	<table align="center">
		<tr>
			<td colspan="1" align="center">姓名</td>
			<td colspan="1" align="center">${student.name}</td>
			<td colspan="1" align="center">性别</td>
			<td colspan="1" align="center">${student.sex}</td>
			<td rowspan="2">
				<img width="125" src="${pageContext.request.contextPath}${student.imagePath}" />
			</td>
		</tr>
		<tr>
			<td colspan="1">班级</td>
			<td colspan="1">${student.grade.name}</td>
			<td colspan="1">出生日期</td>
			<td colspan="1">${student.birthday}</td>
		</tr>
		<tr>
			<td colspan="1" align="center">个人信息</td>
			<td colspan="4" align="left">${student.information}</td>
		</tr>
	</table>
</body>
<body background="https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1547130118923&amp;di=85135f511b2e05a2946b6b551e4e478d&amp;imgtype=0&amp;src=http%3A%2F%2Fwww.deskcar.com%2Fdesktop%2Fcartoon%2Fchina%2F2012317210314%2F13.jpg"style=" background-size: cover;display: block;">
</html>