package com.wstro;

import org.springframework.boot.Banner.Mode;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

/**
 * SpringBoot
 * 
 * @author wangwh
 * @date 2017-09-27
 *
 */
@ServletComponentScan
@SpringBootApplication
@ComponentScan(basePackages = { "com.wstro" })
public class App extends SpringBootServletInitializer {

	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		SpringApplication app = new SpringApplication(App.class);
		app.setBannerMode(Mode.CONSOLE);
		app.run(App.class, args);
	}

	/**
	 * 为了将项目打包成war在Tomcat里面部署运行 
	 */
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(App.class);
	}

}
