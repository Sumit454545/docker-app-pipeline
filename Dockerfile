FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/mydockerapp-1.0-SNAPSHOT.jar myapp.jar
CMD ["java", "-jar", "myapp.jar"]


