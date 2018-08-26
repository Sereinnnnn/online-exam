package com.github.tangyi.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerInterceptor;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.web.client.RestTemplate;

@EnableZuulProxy
@EnableFeignClients
@EnableGlobalMethodSecurity(prePostEnabled = true)
@SpringBootApplication
@ComponentScan({"com.github.tangyi.common"})
public class OnlineExamGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineExamGatewayApplication.class, args);
	}

	@Bean
	LoadBalancerInterceptor loadBalancerInterceptor(LoadBalancerClient loadBalance){
		return new LoadBalancerInterceptor(loadBalance);
	}

	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
}
