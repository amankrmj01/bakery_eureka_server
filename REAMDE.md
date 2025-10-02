# Bakery Eureka API Gateway

## Overview
The Eureka API Gateway acts as the central routing hub for all microservices within the bakery platform. It uses Netflix Eureka for dynamic service discovery, load balancing, and resilience. It also handles Cross-Origin Resource Sharing (CORS), request logging, health monitoring, and provides metrics.

## Features
- **Service Discovery**: Auto-discovers services registered with Eureka  
- **Load Balancing**: Distributes requests among multiple instances of a service  
- **Cross-Origin Support**: Handles CORS for cross-origin requests  
- **Request Logging**: Logs all incoming traffic for debugging and audit  
- **Health Monitoring**: Reports system status and metrics  
- **Dynamic Routing**: Routes based on the configured paths to specific backend services  

## Dependencies
- Spring Cloud Gateway  
- Spring Cloud Eureka Client  
- Spring Boot Actuator  
- Spring Security (optional for route security)  

## Quick Start

### Run Locally
```bash
./gradlew bootRun
```
The API Gateway will start on port `8080` by default.

### Prerequisites
Eureka Server running on port `8761` to enable service registration and discovery.

## Configuration

Update `application.yml` with relevant properties:

```yaml
spring:
  application:
    name: api-gateway
  cloud:
    discovery:
      enabled: true
      service-id: eureka-server
    gateway:
      routes:
        - id: auth-service
          uri: lb://auth-service
          predicates:
            - Path=/api/auth/**

        - id: order-service
          uri: lb://order-service
          predicates:
            - Path=/api/orders/**

        - id: inventory-service
          uri: lb://inventory-service
          predicates:
            - Path=/api/products/**

        - id: payment-service
          uri: lb://payment-service
          predicates:
            - Path=/api/payments/**

        - id: notification-service
          uri: lb://notification-service
          predicates:
            - Path=/api/notifications/**
```

## Endpoints

### Routes & Discovery
To view current route configuration:
```http
GET http://localhost:8080/actuator/gateway/routes
```

### Health Check
```http
GET http://localhost:8080/actuator/health
```

### Metrics (Prometheus)
```http
GET http://localhost:8080/actuator/prometheus
```
