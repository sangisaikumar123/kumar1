#FROM openjdk:17
#EXPOSE 8080
#ADD target/javaprojectdemo-0.0.1-SNAPSHOT.jar javaprojectdemo-0.0.1-SNAPSHOT.jar
#ENTRYPOINT ["java","-jar","/javaprojectdemo-0.0.1-SNAPSHOT.jar"]
#dockerfile dev
FROM alpine:latest
RUN apk --no-cache add && \
    apk update && \
    apk --no-cache add curl openjdk17 && \
    adduser isw154 --disabled-password && \
    mkdir -p /opt/app/ && \
    chown -R isw154:isw154 /opt/app/
COPY /target/vroova-0.0.1-SNAPSHOT.jar /opt/app/javaprojectdemo-0.0.1-SNAPSHOT.jar

USER isw154
WORKDIR /opt/app/
EXPOSE 8020

ENTRYPOINT exec java -Duser.timezone=GMT -Dserver.port=8020 -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=9757 -Xlog:gc:gclog.log -jar javaprojectdemo-0.0.1-SNAPSHOT.jar
