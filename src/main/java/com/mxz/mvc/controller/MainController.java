package com.mxz.mvc.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mxz.mvc.model.Login;

@Controller
public class MainController
{
	@RequestMapping(value = "/main")
	public String login(Login login, HttpSession session, Model model)
	{
		// 模拟登录验证，验证成功后进入下载页面，否则重新登录
		if ("MXZ".equals(login.getUserName()) && "mxzmvc".equals(login.getPassword()))
		{
			session.setAttribute("loginIn", Boolean.TRUE);
			return "redirect:/downLoad";
		}
		else
		{
			return "login";
		}
	}
}
