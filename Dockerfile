FROM maven:3.8.5-openjdk-17 as build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-slim
COPY --from=build /target/webrtc-0.0.1-SNAPSHOT.jar webrtc.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "webrtc.jar"]
