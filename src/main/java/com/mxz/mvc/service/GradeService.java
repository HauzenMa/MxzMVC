package com.mxz.mvc.service;

import java.util.List;
import com.mxz.mvc.model.Grade;

public interface GradeService
{
	public List<Grade> list();
	
	public void save(Grade grade);
	
	public Grade edit(long id);
	
	public void update(Grade grade);
	
	public void delete(long id);
}
