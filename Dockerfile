FROM eclipse-temurin:25-jdk-alpine AS builder

WORKDIR /app

RUN mkdir -p target

COPY target/*.jar target/app.jar

FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "app.jar"]