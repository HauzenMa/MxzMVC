package com.mxz.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mxz.mvc.model.Login;

@Controller
public class LoginController
{
	@RequestMapping(value = "/login")
	public String login(Model model)
	{
		model.addAttribute(new Login());
		return "login";
	}
}
