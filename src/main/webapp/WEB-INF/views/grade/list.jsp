<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级列表</title>
<style type="text/css">
@import url("<c:url value='/css/table.css'/>");
</style>
</head>
<body>
	<h1>学生班级管理</h1>
	<table align="center">
		<tr>
			<td colspan="8" align="right">
				<a href="<c:url value="add"/>">新增</a>
				<a href="<c:url value="/index"/>">返回</a>
			</td>
		</tr>
		<tr>
			<th>ID</th>
			<th>班级</th>
			<th colspan="3">维护</th>
		</tr>
		<c:forEach items="${grades}" var="grade">
			<tr>
				<td>${grade.id}</td>
				<td>${grade.name}</td>
				<td><a href="edit/${grade.id}">修改</a></td>
				<td><a href="delete/${grade.id}">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>