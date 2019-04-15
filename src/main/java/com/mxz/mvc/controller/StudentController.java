package com.mxz.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.mxz.mvc.model.Grade;
import com.mxz.mvc.model.Student;
import com.mxz.mvc.model.UploadFiles;
import com.mxz.mvc.service.GradeService;
import com.mxz.mvc.service.StudentService;

@SuppressWarnings("unused")
@Controller
@RequestMapping(value = "student")
public class StudentController
{
	@Autowired
	StudentService studentService;
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
		List<Student> students = studentService.list();
		model.addAttribute("students", students);
		return "student/list";
	}
	
	@RequestMapping(value = "add")
	public String add(Model model)
	{
		List<Grade> grades = gradeService.list();
		model.addAttribute("grades", grades);
		model.addAttribute("student", new Student());
		return "student/add";
	}
	
	@RequestMapping(value = "edit/{id}")
	public String edit(Model model, @PathVariable long id)
	{
		List<Grade> grades = gradeService.list();
		model.addAttribute("grades", grades);
		Student student = studentService.edit(id);
		model.addAttribute("student", student);
		return "student/edit";
	}
	
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable long id)
	{
		studentService.delete(id);
		return "redirect:/student/list";
	}
	
	@RequestMapping(value = "save")
	public String save(HttpServletRequest servletRequest, @Valid Student student, BindingResult bindingResult, Model model)
	{
		if (bindingResult.hasErrors())
		{
			FieldError fieldError = bindingResult.getFieldError();
			List<Grade> grades = gradeService.list();
			model.addAttribute("grades", grades);
			return "student/add";
		}
		else
		{
			StringBuilder imagePath = new StringBuilder();
			String relativePath = "/fileUpload/images/";
			imagePath.append(relativePath + student.getImagePath());
			student.setImagePath(imagePath.toString());
			studentService.save(student);
			return "redirect:/student/list";
		}
	}
	
	@RequestMapping(value = "uploadImages")
	public void uploadImages(HttpServletRequest servletRequest, UploadFiles uploadFiles)
	{
		MultipartFile multipartFile = uploadFiles.getMultipartFile();
		String fileName = multipartFile.getOriginalFilename();
		String absolutePath = servletRequest.getServletContext().getRealPath("/fileUpload/images/");
		try
		{
			File file = new File(absolutePath, fileName);
			multipartFile.transferTo(file);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "uploadFiles")
	public void uploadFiles(HttpServletRequest servletRequest, UploadFiles uploadFiles)
	{
		MultipartFile multipartFile = uploadFiles.getMultipartFile();
		String fileName = multipartFile.getOriginalFilename();
		String absolutePath = servletRequest.getServletContext().getRealPath("/fileUpload/files/");
		try
		{
			File file = new File(absolutePath, fileName);
			multipartFile.transferTo(file);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "update")
	public String update(HttpServletRequest servletRequest, @Valid Student student, BindingResult bindingResult, Model model)
	{
		if (bindingResult.hasErrors())
		{
			FieldError fieldError = bindingResult.getFieldError();
			List<Grade> grades = gradeService.list();
			model.addAttribute("grades", grades);
			model.addAttribute(student);
			return "student/edit";
		}
		else
		{
			StringBuilder imagePath = new StringBuilder();
			String relativePath = "/fileUpload/images/";
			imagePath.append(relativePath + student.getImagePath());
			student.setImagePath(imagePath.toString());
			studentService.update(student);
			return "redirect:/student/list";
		}
	}
	
	@RequestMapping(value = "view/{id}")
	public String view(Model model, @PathVariable long id)
	{
		Student student = studentService.view(id);
		model.addAttribute(student);
		return "student/view";
	}
}
