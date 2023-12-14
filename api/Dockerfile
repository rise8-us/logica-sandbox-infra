FROM openjdk:11.0.7-jdk as builder
RUN apt-get update
RUN apt-get install -y ca-certificates-java openjdk-11-jre-headless # needed to resolve issue with certificates
RUN apt-get -y install maven

WORKDIR /reference-api

RUN git clone https://bitbucket.org/hspconsortium/reference-api.git .
RUN mvn package

FROM openjdk:11.0.7-jdk-slim as runner
COPY --from=builder /reference-api/reference-api-webapp/target/hspc-reference-api-webapp-*.jar app.jar
RUN apt-get update
RUN apt-get install -y default-mysql-client

ENV JAVA_OPTS="-Xmx1536m -Djava.security.egd=file:/dev/./urandom"

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar app.jar" ]
