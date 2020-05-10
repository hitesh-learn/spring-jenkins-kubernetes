FROM openjdk:8-jdk-alpine  

ENV APP_FILE demo-0.0.1-SNAPSHOT.jar  
ENV APP_HOME /usr/app  
EXPOSE 3000  
COPY ./target/*.jar $APP_HOME/  
WORKDIR $APP_HOME  
ENTRYPOINT ["sh", "-c"]  
CMD ["exec java -jar demo-0.0.1-SNAPSHOT.jar"]
