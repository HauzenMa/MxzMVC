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
		alert("文件不能超过500MB");
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
		xhr.open("POST", "../computer/uploadImages");
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
	<form:form modelAttribute="student" action="save" method="post" enctype="multipart/form-data">
		<h1>Current Locale : ${pageContext.response.locale}</h1>
		<h1>
			<spring:message code="student.title" />
		</h1>
		<table align="center">
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
					<form:select id="grade" path="grade.id" items="${grades}" itemLabel="name" itemValue="id" />
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
					<form:input path="birthday" />
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
					<input type="file" id="files" name="files" multiple="multiple" />
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
					<input id="reset" type="reset" tabindex="4"> <input id="submit" type="submit" tabindex="5" value="添加">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>

