FROM openjdk:17

ARG JAR_FILE=target/awsInteg-0.0.1-SNAPSHOT.jar
ARG CONFIG_FILE=src/main/resources/application.yml

VOLUME [ "/tmp" ]

COPY ${JAR_FILE} app.jar
COPY ${CONFIG_FILE} application.yml

RUN bash -c 'touch app.jar'

ENTRYPOINT [ "java", "-jar" "app.jar" ]