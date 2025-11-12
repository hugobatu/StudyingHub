# ===== STAGE 1: build =====
#FROM eclipse-temurin:21 AS builder
#WORKDIR /user
#COPY pom.xml .
#COPY src ./src
#RUN apt-get update && apt-get install -y maven
#RUN mvn clean package -DskipTests

# ===== STAGE 2: runtime =====
FROM eclipse-temurin:21-jre-alpine
COPY target/user*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
