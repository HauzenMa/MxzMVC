package com.mxz.mvc.model;

import java.io.Serializable;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import lombok.Data;

@Data
public class Grade implements Serializable
{
	private static final long serialVersionUID = -182322045836392537L;
	private int id;
	@NotEmpty(message = "班级不能为空！")
	@Size(min = 2, max = 15, message = "班级名字长度应该在2-15个字符！")
	private String name;
}
