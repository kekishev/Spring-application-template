FROM maven:3.9.13-eclipse-temurin-25 AS build
WORKDIR /app

COPY src src
COPY pom.xml .

RUN mvn clean package

FROM eclipse-temurin:25-jre
WORKDIR /app

COPY --from=build /app/target/spring-application-template-0.0.1.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]