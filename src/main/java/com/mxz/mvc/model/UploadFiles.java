package com.mxz.mvc.model;

import java.io.Serializable;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class UploadFiles implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private MultipartFile multipartFile;
}