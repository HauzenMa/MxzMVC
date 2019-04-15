package com.mxz.mvc.model;

import java.io.Serializable;
import lombok.Data;

@Data
public class Login implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String userName;
	
	private String password;
}
