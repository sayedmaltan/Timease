FROM openjdk:17-jdk-slim

# Install dependencies for live reloading
RUN apt-get update && apt-get install -y maven

# Set the working directory
WORKDIR /app

# Copy the pom.xml and install dependencies (cache layer)
COPY pom.xml /app/
#RUN mvn dependency:go-offline

# Copy the source code
COPY src /app/src

# Command to start the Spring Boot application with live reload
CMD ["mvn", "spring-boot:run"]

# Expose the application's port
EXPOSE 8080
