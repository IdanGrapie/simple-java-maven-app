# First stage: Build the application
FROM maven:3.8.6-jdk-11 as build
COPY . /app
WORKDIR /app
RUN mvn clean package

# Second stage: Prepare the runtime image
FROM openjdk:11-jre-slim
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar /usr/local/lib/my-app.jar
EXPOSE 8080
CMD ["java", "-jar", "/usr/local/lib/my-app.jar"]
