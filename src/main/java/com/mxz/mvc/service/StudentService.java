package com.mxz.mvc.service;

import java.util.List;
import com.mxz.mvc.model.Student;

public interface StudentService
{
	public List<Student> list();
	
	public void save(Student student);
	
	public Student edit(long id);
	
	public void update(Student student);
	
	public void delete(long id);
	
	public Student view(long id);
}
