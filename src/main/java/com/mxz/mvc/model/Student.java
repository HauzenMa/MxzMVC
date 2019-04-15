package com.mxz.mvc.model;

import java.io.Serializable;
import java.time.LocalDate;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import lombok.Data;

@Data
public class Student implements Serializable
{
	private static final long serialVersionUID = -8049259122660549286L;
	private int id;
	@NotEmpty(message = "名字不能为空！")
	@Size(min = 2, max = 4, message = "名字应该在2-4个字符！")
	private String name;
	@NotEmpty(message = "性别不能为空！")
	@Size(min = 1, max = 1, message = "性别应该在1个字符！")
	private String sex;
	@NotNull(message = "不能为空！")
	private Grade grade;
	@NotNull(message = "出生日期不能为空！")
	@Past(message = "出生日期一般应是一个过去的日期，不是当天。")
	private LocalDate birthday;
	@NotEmpty(message = "图片不能为空！")
	private String imagePath;
	@NotEmpty(message = "个人信息不能为空！")
	private String information;
}
