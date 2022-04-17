
# Set up JDK 11
FROM openjdk:11
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Main.java
CMD ["java", "Main"]


FROM alpine:3.10

ARG rules-directory=

COPY pom.xml /pom.xml
COPY src /src
COPY target /target

CMD ["mvn install -DskipTests"]
