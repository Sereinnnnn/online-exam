package com.github.tangyi.zipkin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import zipkin.server.internal.EnableZipkinServer;

@SpringBootApplication
@EnableZipkinServer
@EnableDiscoveryClient
public class OnlineExamZipkinApplication {

    public static void main(String[] args) {
        SpringApplication.run(OnlineExamZipkinApplication.class, args);
    }
}
