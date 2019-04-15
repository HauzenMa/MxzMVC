<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>修改班级</title>
<style type="text/css">
@import url("<c:url value='/css/table.css'/>");
</style>
</head>
<body>
	<c:url var="formAction" value="/grade/update" />
	<form:form modelAttribute="grade" action="${formAction}" method="post">
		<form:hidden path="id" />
		<h1>
			<spring:message code="grade.updateTitle" />
		</h1>
		<table align="center">
			<tr>
				<td colspan="2">
					<form:errors path="name" />
				</td>
			</tr>
			<tr>
				<td>
					<spring:message code="grade.name" />
				</td>
				<td>
					<form:input path="name" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input id="reset" type="reset" tabindex="4"> <input id="submit" type="submit" tabindex="5" value="修改">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
