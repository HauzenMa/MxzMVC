package com.mxz.mvc.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DownloadService
{
	public void downloadFile(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
