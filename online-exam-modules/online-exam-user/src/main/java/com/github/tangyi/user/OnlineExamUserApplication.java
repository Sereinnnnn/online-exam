package com.github.tangyi.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

@EnableDiscoveryClient
@SpringBootApplication
@ComponentScan(basePackages = {"com.github.tangyi.common", "com.github.tangyi.user"})
public class OnlineExamUserApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineExamUserApplication.class, args);
	}
}
