package com.mxz.mvc.utils;

import java.util.Locale;

public class LocaleTest
{
	public static void main(String[] args)
	{
		// 1.使用默认方式
		Locale locale = Locale.getDefault();
		System.out.println(locale);
		System.out.println();
		// 2.使用静态对象
		locale = Locale.CHINA;
		System.out.println(locale);
		locale = Locale.CHINESE;
		System.out.println(locale);
		System.out.println();
		// 3.使用构造方法
		locale = new Locale("zh", "CN");
		System.out.println(locale);
		System.out.println();
		// 查看Locale支持的全部区域
		Locale[] ls = Locale.getAvailableLocales();
		for (Locale l : ls)
		{
			System.out.print(l + ", ");
		}
	}
}
