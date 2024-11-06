FROM openjdk:11-jdk
COPY . /devops_model
WORKDIR /devops_lab
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
