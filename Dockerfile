FROM maven:3.8-jdk-11 AS build
WORKDIR /project
COPY . /project
RUN mvn clean package
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /project/target/awsInteg-0.0.1-SNAPSHOT.jar ./

CMD [ "java", "-jar","./awsInteg-0.0.1-SNAPSHOT.jar" ]

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