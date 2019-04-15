package com.mxz.mvc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mxz.mvc.dao.GradeDao;
import com.mxz.mvc.model.Grade;
import com.mxz.mvc.service.GradeService;

@Service
public class GradeServiceImpl implements GradeService
{
	@Autowired
	GradeDao gradeDao;
	
	@Override
	public List<Grade> list()
	{
		return gradeDao.list();
	}
	
	@Override
	public void save(Grade grade)
	{
		gradeDao.save(grade);
	}
	
	@Override
	public Grade edit(long id)
	{
		return gradeDao.getGrade(id);
	}
	
	@Override
	public void update(Grade grade)
	{
		gradeDao.update(grade);
	}
	
	@Override
	public void delete(long id)
	{
		gradeDao.delete(id);
	}
}
