FROM eclipse-temurin:17-jdk-jammy

# Set the working directory inside the container
WORKDIR /app

# Copy everything into the container
COPY petclinic-APP-projet/ .

# Copy Maven wrapper and project files
COPY petclinic-APP-projet/.mvn/ .mvn
COPY petclinic-APP-projet/mvnw .
COPY petclinic-APP-projet/pom.xml .

# Preload dependencies
RUN chmod +x ./mvnw && ./mvnw dependency:resolve

# Copy source code
COPY petclinic-APP-projet/src ./src

# Run the application
CMD ["./mvnw", "spring-boot:run"]
