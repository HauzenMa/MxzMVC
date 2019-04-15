package com.mxz.mvc.config;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ConversionServiceFactoryBean;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;
import com.mxz.mvc.config.converter.DateConverter;
import com.mxz.mvc.config.formatter.MyDateFormatter;

@SuppressWarnings({ "unchecked", "rawtypes" })
@Configuration// @Configuration该注解表示这个类用来配置一些bean，相当于spring的xml配置文件
public class WebConfig
{
	@Autowired
	DateConverter dateConverter;
	@Autowired
	MyDateFormatter dateFormatter;
	
	@Bean// @Bean注解，用来定义bean，该bean的默认的名字就是该方法的名字，即messageSource
	public ReloadableResourceBundleMessageSource messageSource()
	{
		// 配置消息转换器
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		// 设置消息转换器的编码
		messageSource.setDefaultEncoding("UTF-8");
		// 设置“useCodeAsDefaultMessage”，默认为false，这样当Spring在ResourceBundle中找不到messageKey的话，
		// 就抛出NoSuchMessageException，
		// 把它设置为True，则找不到不会抛出异常，而是使用messageKey作为返回值。
		messageSource.setUseCodeAsDefaultMessage(true);
		// 加载消息转换属性文件，默认的后缀是properties，这里加载的是messages.properties文件
		// 该文件在src/main/resources目录下面，编译后，会放在classpath下面，因此需要采用下下面的方式加载
		messageSource.setBasename("classpath:messages");
		return messageSource;
	}
	
	@Bean
	public ConversionServiceFactoryBean conversionService()
	{
		// 配置格式化工厂
		ConversionServiceFactoryBean csf = new ConversionServiceFactoryBean();
		// ConversionServiceFactoryBean有一个converters属性，使用set加载具体的格式化器
		Set converters = new HashSet();
		converters.add(dateConverter);
		csf.setConverters(converters);
		return csf;
	}
	
	@Bean
	public FormattingConversionServiceFactoryBean formatterService()
	{
		// 配置格式化器
		FormattingConversionServiceFactoryBean fcf = new FormattingConversionServiceFactoryBean();
		Set formatters = new HashSet();
		formatters.add(dateFormatter);
		// 通过set方法加载
		fcf.setFormatters(formatters);
		return fcf;
	}
	
	// 配置语言区域解析器
	@Bean
	public AcceptHeaderLocaleResolver alocaleResolver()
	{
		AcceptHeaderLocaleResolver ahlr = new AcceptHeaderLocaleResolver();
		// 设置默认时区为中国
		Locale locale = Locale.CHINA;
		ahlr.setDefaultLocale(locale);
		return ahlr;
	}
	
	// 定义文件上传解析器
	@Bean(value = "multipartResolver")
	public CommonsMultipartResolver commonsMultipartResolver()
	{
		CommonsMultipartResolver cmResolver = new CommonsMultipartResolver();
		// 设定默认编码
		cmResolver.setDefaultEncoding("UTF-8");
		// 设定文件上传的最大值,以字节为单位计算。当设为-1时表示无限制，默认是-1。
		cmResolver.setMaxUploadSize(500 * 1024 * 1024);
		// 设定文件上传时写入内存的最大值，以字节为单位计算,如果小于这个参数不会生成临时文件，默认为10240
		cmResolver.setMaxInMemorySize(2 * 10 * 1024);
		// 延迟文件解析，可以在Controller中捕获文件大小异常
		cmResolver.setResolveLazily(true);
		return cmResolver;
	}
	
	// 定义文件上传解析器
	// @Bean(value = "multipartResolver")
	StandardServletMultipartResolver standardServletMultipartResolver()
	{
		StandardServletMultipartResolver smResolver = new StandardServletMultipartResolver();
		return smResolver;
	}
}
