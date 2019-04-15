<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>修改学生</title>
<style type="text/css">
@import url("<c:url value='/css/table.css'/>");
</style>
<script>
	var totalFileLength, totalUploaded, fileCount, filesUploaded, files;

	function debug(s)
	{
		var debug = document.getElementById('debug');
		if (debug)
		{
			debug.innerHTML = debug.innerHTML + '<br/>' + s;
		}
	}

	function onUploadComplete(e)
	{
		files = document.getElementById('files').files[filesUploaded];
		totalUploaded += files.size;
		filesUploaded++;
		debug('complete ' + filesUploaded + " of " + fileCount);
		debug('totalUploaded: ' + totalUploaded);
		if (filesUploaded < fileCount)
		{
			uploadNext();
		}
		else
		{
			var bar = document.getElementById('bar');
			bar.style.width = '100%';
			bar.innerHTML = '100% complete';
			document.getElementById("imagePath").value = files.name;
		}
	}

	function onFileSelect(e)
	{
		var files = e.target.files; // FileList object
		var output = [];
		fileCount = files.length;
		totalFileLength = 0;
		for (var i = 0; i < fileCount; i++)
		{
			var file = files[i];
			output.push(file.name, ' (', file.size, ' bytes, ', file.lastModifiedDate.toLocaleDateString(), ')');
			output.push('<br/>');
			debug('add ' + file.size);
			totalFileLength += file.size;
		}
		document.getElementById('selectedFiles').innerHTML = output.join('');
		debug('totalFileLength:' + totalFileLength);
	}

	function onUploadProgress(e)
	{
		if (e.lengthComputable)
		{
			var percentComplete = parseInt((e.loaded + totalUploaded) * 100 / totalFileLength);
			var bar = document.getElementById('bar');
			bar.style.width = percentComplete + '%';
			bar.innerHTML = percentComplete + ' % complete';
		}
		else
		{
			debug('unable to compute');
		}
	}

	function onUploadFailed(e)
	{
		alert("Error uploading file");
	}

	function uploadNext()
	{
		var xhr = new XMLHttpRequest();
		var fd = new FormData();
		var file = document.getElementById('files').files[filesUploaded];
		fd.append("multipartFile", file);
		xhr.upload.addEventListener("progress", onUploadProgress, false);
		xhr.addEventListener("load", onUploadComplete, false);
		xhr.addEventListener("error", onUploadFailed, false);
		xhr.open("POST", "../uploadImages");
		debug('uploading ' + file.name);
		xhr.send(fd);
	}

	function startUpload()
	{
		totalUploaded = filesUploaded = 0;
		uploadNext();
	}
	window.onload = function()
	{
		document.getElementById('files').addEventListener('change', onFileSelect, false);
		document.getElementById('uploadButton').addEventListener('click', startUpload, false);
	}
</script>
</head>
<body>
	<c:url var="formAction" value="/student/update" />
	<form:form modelAttribute="student" action="${formAction}" method="post">
		<form:hidden path="id" />
		<h1>
			<spring:message code="student.updateTitle" />
		</h1>
		<table align="center">
			<form:hidden path="id" />
			<tr>
				<td colspan="2">
					<form:errors path="name" />
				</td>
			</tr>
			<tr>
				<td><spring:message code="student.name" /></td>
				<td>
					<form:input path="name" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<form:errors path="sex" />
				</td>
			</tr>
			<tr>
				<td><spring:message code="student.sex" /></td>
				<td>
					<form:input path="sex" />
				</td>
			</tr>
			<tr>
				<td><spring:message code="student.grade" /></td>
				<td>
					<select id="grade.id" name="grade.id">
						<c:forEach items="${grades}" var="grade">
							<option value="${grade.id}" <c:if test="${student.grade.id eq grade.id}">selected</c:if>>${grade.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<form:errors path="birthday" />
				</td>
			</tr>
			<tr>
				<td><spring:message code="student.birthday" /></td>
				<td>
					<form:input path="birthday" value="${student.birthday}" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<form:errors path="imagePath" />
				</td>
			</tr>
			<tr>
			<td><spring:message code="student.imagePath" /></td>
				<td>
					<form:input path="imagePath" readonly="readonly" />
					<div id='progressBar' style='height: 20px; border: 1px solid #cccccc'>
						<div id='bar' style='height: 100%; background: #cccccc; width: 0%'></div>
					</div>
					<input type="file" id="files" name="files"/>
					<input id="uploadButton" type="button" value="Upload" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<form:errors path="information" />
				</td>
			</tr>
			<tr>
				<td><spring:message code="student.information" /></td>
				<td>
					<form:input path="information" />
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

