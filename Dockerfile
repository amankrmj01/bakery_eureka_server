FROM openjdk:21-jdk-slim

WORKDIR /app

# Copy the jar file
COPY build/libs/bakery_eureka_server-0.0.1-SNAPSHOT.jar eureka-server.jar

# Expose port
EXPOSE 8761

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8761/actuator/health || exit 1

# Run the application
ENTRYPOINT ["java", "-jar", "eureka-server.jar"]
