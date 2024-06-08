FROM maven:3.8.7-openjdk-18-slim AS build

RUN mkdir /opt/fiap-gs1

COPY . /opt/fiap-gs1

WORKDIR /opt/fiap-gs1

RUN mvn clean package

FROM eclipse-temurin:18-jre-alpine

RUN mkdir /opt/fiap-gs1

COPY --from=build  /opt/fiap-gs1/target/globalsolution-0.0.1-SNAPSHOT.jar /opt/fiap-gs1/globalsolution-0.0.1-SNAPSHOT.jar

WORKDIR /opt/fiap-gs1

ENV PROFILE=dev

EXPOSE 8080

ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILE}", "-jar", "globalsolution-0.0.1-SNAPSHOT.jar"]