package com.mxz.mvc.controller;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mxz.mvc.model.Grade;
import com.mxz.mvc.service.GradeService;

@SuppressWarnings("unused")
@Controller
@RequestMapping(value = "grade")
public class GradeController
{
	@Autowired
	GradeService gradeService;
	
	@RequestMapping(value = "index")
	public String index()
	{
		return "index";
	}
	
	@RequestMapping(value = "list")
	public String list(Model model)
	{
		List<Grade> grades = gradeService.list();
		model.addAttribute("grades", grades);
		return "grade/list";
	}
	
	@RequestMapping(value = "add")
	public String add(Model model)
	{
		model.addAttribute("grade", new Grade());
		return "grade/add";
	}
	
	@RequestMapping(value = "edit/{id}")
	public String edit(Model model, @PathVariable long id)
	{
		Grade grade = gradeService.edit(id);
		model.addAttribute("grade", grade);
		return "grade/edit";
	}
	
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable long id)
	{
		gradeService.delete(id);
		return "redirect:/grade/list";
	}
	
	@RequestMapping(value = "save")
	public String save(@Valid Grade grade, BindingResult bindingResult, Model model)
	{
		if (bindingResult.hasErrors())
		{
			FieldError fieldError = bindingResult.getFieldError();
			return "grade/add";
		}
		else
		{
			gradeService.save(grade);
			return "redirect:/grade/list";// 重定向到列表页
		}
	}
	
	@RequestMapping(value = "update")
	public String update(@Validated Grade grade, BindingResult bindingResult, Model model)
	{
		if (bindingResult.hasErrors())
		{
			FieldError fieldError = bindingResult.getFieldError();
			return "grade/edit";
		}
		else
		{
			gradeService.update(grade);
			return "redirect:/grade/list";
		}
	}
}
