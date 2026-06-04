package com.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.app.service.BookService;

public class App2 {
public static void main(String[] args) {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("bean.xml");
	BookService s = context.getBean(BookService.class);
	System.out.println(s);
}
}
