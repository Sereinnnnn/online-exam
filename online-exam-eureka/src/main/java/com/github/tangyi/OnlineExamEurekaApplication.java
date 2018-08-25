package com.github.tangyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class OnlineExamEurekaApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineExamEurekaApplication.class, args);
	}
}
