package com.mxz.mvc.config.converter;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component(value = "dateConverter")
public class DateConverter implements Converter<String, LocalDate>
{
	@Override
	public LocalDate convert(String source)
	{
		// 定义日期格式：yyyy-MM-dd
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		try
		{
			return LocalDate.parse(source);
		}
		catch (DateTimeParseException e)
		{
			// 将错误信息传递给<form:errors>在页面显示
			throw new IllegalArgumentException("日期格式不对");
		}
	}
}
