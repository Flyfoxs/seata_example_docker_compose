FROM java:alpine
VOLUME /tmp
ADD *-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
