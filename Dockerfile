# Use official OpenJDK 17
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Ensure mvnw is executable
RUN chmod +x mvnw

# Build the app (skip tests for faster builds)
RUN ./mvnw clean package -DskipTests

# Expose port
EXPOSE 8080

# Run the executable WAR produced by Spring Boot
CMD ["java", "-jar", "target/Student_ManagementApp-0.0.1-SNAPSHOT.war"]
