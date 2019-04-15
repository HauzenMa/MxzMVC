<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生列表</title>
<style type="text/css">
@import url("<c:url value='/css/table.css'/>");
</style>
</head>
<body>
	<h1>学生信息管理</h1>
	<table align="center">
		<tr>
			<td colspan="8" align="right">
				<a href="<c:url value="add"/>">新增</a>
				<a href="<c:url value="/index"/>">返回</a>
			</td>
		</tr>
		<tr>
			<th>ID</th>
			<th>姓名</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>班级</th>
			<th colspan="3" nowrap="nowrap">维护</th>
		</tr>
		<c:forEach items="${students}" var="student">
			<tr>
				<td>${student.id}</td>
				<td>${student.name}</td>
				<td>${student.sex}</td>
				<td nowrap="nowrap">${student.birthday}</td>
				<td nowrap="nowrap">${student.grade.name}</td>
				<td>
					<a href="view/${student.id}" target="_blank">查看</a>
				</td>
				<td>
					<a href="edit/${student.id}">修改</a>
				</td>
				<td>
					<a href="delete/${student.id}">删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
