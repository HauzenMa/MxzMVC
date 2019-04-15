<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>MxzMVC的文件下载</title>
<meta charset="UTF-8">
<style type="text/css">
@import url("<c:url value='/css/table.css'/>");
</style>
</head>
<body>
	<table align="center">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/downLoad/简历.pdf/">马祥哲的简历</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/downLoad/2016级信息与计算科学2班通讯录.xlsx/">2016级信息与计算科学2班通讯录.</a>
			</td>
		</tr>
	</table>
</body>
</html>