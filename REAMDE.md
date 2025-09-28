# Bakery Eureka Server

Service Discovery server for the Bakery Microservices ecosystem.

## Quick Start

### Run Locally
./gradlew bootRun

text

### Build JAR
./gradlew bootJar

text

### Docker Build
docker build -t bakery-eureka-server .

text

## Endpoints

- **Eureka Dashboard**: http://localhost:8761
- **Health Check**: http://localhost:8761/actuator/health
- **Metrics**: http://localhost:8761/actuator/prometheus

## Configuration

- **Port**: 8761
- **Self-preservation**: Disabled (development mode)
- **Monitoring**: Actuator + Prometheus enabled
