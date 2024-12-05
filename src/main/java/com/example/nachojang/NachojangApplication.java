package com.example.nachojang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class NachojangApplication implements WebMvcConfigurer {
	@Autowired StaffOnInterceptor staffOnInterceptor;
	@Autowired StaffOffInterceptor staffOffInterceptor;
	@Autowired CustomerOnInterceptor customerOnInterceptor;
	@Autowired CustomerOffInterceptor customerOffInterceptor;

	public static void main(String[] args) {
		SpringApplication.run(NachojangApplication.class, args);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//staffOnSession registry 설정
		registry.addInterceptor(staffOnInterceptor).addPathPatterns("/staff/on/**");
		//staffOffSession registry 설정
		registry.addInterceptor(staffOffInterceptor).addPathPatterns("/staff/off/**");
		//customerOnSession registry 설정
		registry.addInterceptor(customerOnInterceptor).addPathPatterns("/customer/on/**");
		//customerOffSession registry 설정
		registry.addInterceptor(customerOffInterceptor).addPathPatterns("/customer/off/**");
		
		WebMvcConfigurer.super.addInterceptors(registry);
		
	}

}
