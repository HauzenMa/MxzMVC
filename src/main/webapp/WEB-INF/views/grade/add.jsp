<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
<title>添加班级</title>
<style type="text/css">
@import url("<c:url value='/css/table.css'/>");
</style>
</head>
<body>
	<form:form modelAttribute="grade" action="save" method="post">
		<h1>Current Locale : ${pageContext.response.locale}</h1>
		<h1>
			<spring:message code="grade.title" />
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
					<input id="reset" type="reset" tabindex="4"><input id="submit" type="submit" tabindex="5" value="添加">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
