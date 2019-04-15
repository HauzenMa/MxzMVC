package com.mxz.mvc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mxz.mvc.dao.StudentDao;
import com.mxz.mvc.model.Student;
import com.mxz.mvc.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	StudentDao studentDao;
	
	@Override
	public List<Student> list()
	{
		return studentDao.list();
	}
	
	@Override
	public void save(Student grade)
	{
		studentDao.save(grade);
	}
	
	@Override
	public Student edit(long id)
	{
		return studentDao.getStudent(id);
	}
	
	@Override
	public Student view(long id)
	{
		return studentDao.viewStudent(id);
	}
	
	@Override
	public void update(Student grade)
	{
		studentDao.update(grade);
	}
	
	@Override
	public void delete(long id)
	{
		studentDao.delete(id);
	}
}
