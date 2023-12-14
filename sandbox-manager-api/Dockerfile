FROM openjdk:11.0.7-jdk as builder
RUN apt-get update
RUN apt-get install -y ca-certificates-java openjdk-11-jre-headless # needed to resolve issue with certificates
RUN apt-get -y install maven

WORKDIR /sandbox-manager-api

RUN git clone https://bitbucket.org/hspconsortium/sandbox-manager-api.git .
RUN git checkout 1.3.7
ADD application.yml /sandbox-manager-api/src/main/application.yml
RUN mvn package

FROM openjdk:11.0.7-jdk-slim as runner
COPY --from=builder /sandbox-manager-api/target/hspc-sandbox-manager-api-*.jar app.jar

ENV JAVA_OPTS=""

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar app.jar" ]
