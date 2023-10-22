# Dockerfile

```
#basic example
FROM alpine #layer: base layer
LABLE maintainer="foo@bar.com" #metadata: simple key-value pairs
RUN apk add --update nodejs nodejs-npm  #layer: run this set of commands when the image is build
COPY . /source #layer: copy coud into the image
WORKDIR /source #metadata
RUN npm install #layer
EXPOSE 8080 #metadata: tcp port 8080 is requested
ENTRYPOINT ["node", "./application.js"] #metadata: define the command that is executed when the container is started
```

[Multi-Stage-Builds](https://github.com/nigelpoulton/atsea-sample-shop-app/tree/master/app).

```

FROM node:latest AS storefront
WORKDIR /usr/src/atsea/app/react-app
COPY react-app .
RUN npm install
RUN npm run build

FROM maven:latest AS appserver
WORKDIR /usr/src/atsea
COPY pom.xml .
RUN mvn -B -f pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
COPY . .
RUN mvn -B -s /usr/share/maven/ref/settings-docker.xml package -DskipTests

FROM java:8-jdk-alpine
RUN adduser -Dh /home/gordon gordon
WORKDIR /static
COPY --from=storefront /usr/src/atsea/app/react-app/build/ .
WORKDIR /app
COPY --from=appserver /usr/src/atsea/target/AtSea-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java", "-jar", "/app/AtSea-0.0.1-SNAPSHOT.jar"]
CMD ["--spring.profiles.active=postgres"]
```

## hints

* put things that changes often at the end to put the "cache miss"-chance to the end
* use "no-install-recommends" flag when using "apt-get install"
