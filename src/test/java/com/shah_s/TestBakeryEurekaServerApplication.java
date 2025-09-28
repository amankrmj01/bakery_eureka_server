package com.shah_s;

import org.springframework.boot.SpringApplication;

public class TestBakeryEurekaServerApplication {

    public static void main(String[] args) {
        SpringApplication.from(BakeryEurekaServerApplication::main).with(TestcontainersConfiguration.class).run(args);
    }

}
