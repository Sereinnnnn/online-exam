package com.github.tangyi.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@EnableDiscoveryClient
@EnableFeignClients
@SpringBootApplication
@ComponentScan(basePackages = {"com.github.tangyi.common", "com.github.tangyi.auth"})
public class OnlineExamAuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineExamAuthApplication.class, args);
	}
}
