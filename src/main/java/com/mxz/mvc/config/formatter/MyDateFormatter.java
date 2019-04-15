package com.mxz.mvc.config.formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Locale;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

@Component
public class MyDateFormatter implements Formatter<LocalDate>
{
	@Override
	public String print(LocalDate object, Locale locale)
	{
		return null;
	}
	
	@Override
	public LocalDate parse(String text, Locale locale) throws ParseException
	{
		// 定义日期格式：yyyy-MM-dd
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		try
		{
			return LocalDate.parse(text);
		}
		catch (DateTimeParseException e)
		{
			// 将错误信息传递给<form:errors>在页面显示
			throw new IllegalArgumentException("日期格式不对");
		}
	}
}
