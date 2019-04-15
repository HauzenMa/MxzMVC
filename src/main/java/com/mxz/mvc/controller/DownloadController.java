package com.mxz.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mxz.mvc.service.DownloadService;

@Controller
public class DownloadController
{
	@Autowired
	DownloadService downloadService;
	
	// 进入下载页面
	@RequestMapping("downLoad")
	public String download(HttpSession session) throws Exception
	{
		if (session == null || session.getAttribute("loginIn") == null)
		{
			return "redirect:/login";
		}
		else
		{
			return "download/download";
		}
	}
	
	// 下载文件
	@RequestMapping("/downLoad/{fileName}/")
	public String downloadFile(HttpSession session, @PathVariable("fileName") String fileNames, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		if (session == null || session.getAttribute("loginIn") == null)
		{
			return "redirect:/login";
		}
		downloadService.downloadFile(fileNames, request, response);
		return null;
	}
}
