FROM openjdk:17
EXPOSE 8080
ADD target/javaprojectdemo-0.0.1-SNAPSHOT.jar javaprojectdemo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/javaprojectdemo-0.0.1-SNAPSHOT.jar"]
