FROM maven as builder
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -e -B package

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=builder /app/target /app
CMD ["java", "-jar", "jb-hello-world-maven-0.1.0.jar"]



