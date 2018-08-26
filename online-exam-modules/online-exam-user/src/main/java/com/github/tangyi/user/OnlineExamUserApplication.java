package com.github.tangyi.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class OnlineExamUserApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineExamUserApplication.class, args);
	}
}
