FROM alpine:3.10

ARG rules-directory=

COPY pom.xml /pom.xml
COPY src /src
COPY target /target

CMD ["mvn install -DskipTests"]
