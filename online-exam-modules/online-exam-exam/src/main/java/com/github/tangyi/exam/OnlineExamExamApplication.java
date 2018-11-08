package com.github.tangyi.exam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableOAuth2Sso
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.github.tangyi.common", "com.github.tangyi.exam"})
public class OnlineExamExamApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineExamExamApplication.class, args);
	}
}
