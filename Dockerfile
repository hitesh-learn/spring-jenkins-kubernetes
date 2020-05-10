FROM openjdk:8-jdk-alpine  

ENV APP_FILE demo-0.0.1-SNAPSHOT.jar  
ENV APP_HOME /tmp/app 
EXPOSE 3000  
COPY **/$APP_FILE $APP_HOME/  
WORKDIR $APP_HOME  
ENTRYPOINT ["sh", "-c"]  
CMD ["exec java -jar $APP_FILE"]
