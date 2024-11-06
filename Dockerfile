FROM openjdk:11-jdk
COPY . /app
WORKDIR /app
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
