# FROM openjdk:8-jdk-alpine  

# ENV APP_FILE demo-0.0.1-SNAPSHOT.jar  
# ENV APP_HOME /usr/app  
# EXPOSE 3000  
# COPY ./*.jar $APP_HOME/  
# WORKDIR $APP_HOME  
# ENTRYPOINT ["sh", "-c"]  
# CMD ["exec java -jar $APP_FILE"]



FROM openjdk:8-jdk-alpine 
VOLUME /tmp
ADD demo-0.0.1-SNAPSHOT.jar  app.jar
EXPOSE 3000
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]