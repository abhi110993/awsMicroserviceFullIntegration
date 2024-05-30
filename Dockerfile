FROM openjdk:17

ARG JAR_FILE=target/awsInteg-0.0.1-SNAPSHOT.jar
ARG CONFIG_FILE=src/main/resources/application.yml

VOLUME [ "/tmp" ]

COPY ${JAR_FILE} app.jar
COPY ${CONFIG_FILE} application.yml

# RUN bash -c 'touch app.jar'

CMD [ "java", "-jar","./app.jar" ]
# ENTRYPOINT [ "java", "-jar" "app.jar" ]

#
#
# FROM maven:3.8-jdk-11 AS build
#
# WORKDIR /project
#
# COPY ./javaapp/ /project
#
# RUN mvn clean package
#
# FROM openjdk:11-jre-slim
#
# WORKDIR /app
#
# COPY --from=build /project/target/helloworld-1.0-SNAPSHOT.jar ./
#
# CMD ["java", "-jar", "./helloworld-1.0-SNAPSHOT.jar"]