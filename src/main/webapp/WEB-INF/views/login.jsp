<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<style type="text/css">
@import url("<c:url value='/css/table.css'/>");
</style>
</head>
<body>
	<div id="global">
		<form:form modelAttribute="login" action="main" method="post">
			<table align="center">
				<tr>
					<td>UserName:</td>
					<td>
						<form:input path="userName" value="MXZ" />
					</td>
				</tr>
				<tr>
					<td>Password:</td>
					<td>
						<form:password path="password" value="mxzmvc" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="reset" type="reset"> <input id="submit" type="submit" value="Login">
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>