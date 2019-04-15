package com.mxz.mvc.dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.mxz.mvc.model.Grade;

public interface GradeDao
{
	@Select("select * from grade")
	public List<Grade> list();
	
	@Insert("insert into grade values(#{id},#{name})")
	@Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
	public void save(Grade grade);
	
	@Select("select * from grade where id = #{id}")
	public Grade getGrade(long id);
	
	@Select("select id from grade where id = #{id}")
	public int getGradeId(long id);
	
	@Update("update grade set name = #{name} where id = #{id}")
	public void update(Grade grade);
	
	@Delete("delete from grade where id = #{id}")
	public void delete(long id);
}
