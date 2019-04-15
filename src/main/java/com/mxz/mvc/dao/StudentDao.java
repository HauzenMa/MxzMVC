package com.mxz.mvc.dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.mxz.mvc.model.Student;

public interface StudentDao
{
	@Select("select * from student")
	@Results({ @Result(id = true, column = "id", property = "id"), @Result(property = "grade", column = "gradeid", one = @One(select = "com.mxz.mvc.dao.GradeDao.getGrade")) })
	public List<Student> list();
	
	@Insert("insert into student values(#{id},#{name},#{sex},#{grade.id},#{birthday},#{imagePath},#{information})")
	@Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
	public void save(Student student);
	
	@Select("select * from student where id = #{id}")
	@Results({ @Result(property = "grade.id", column = "gradeid", one = @One(select = "com.mxz.mvc.dao.GradeDao.getGradeId")) })
	public Student getStudent(long id);
	
	@Select("select * from student where id = #{id}")
	@Results({ @Result(property = "grade", column = "gradeid", one = @One(select = "com.mxz.mvc.dao.GradeDao.getGrade")) })
	public Student viewStudent(long id);
	
	@Update("update student set name = #{name},sex = #{sex},gradeid = #{grade.id},birthday = #{birthday},imagepath = #{imagePath},information=#{information} where id = #{id}")
	public void update(Student student);
	
	@Delete("delete from student where id = #{id}")
	public void delete(long id);
}
