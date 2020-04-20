# FROM openjdk:8-jdk-alpine AS builder
# WORKDIR target/dependency
# ARG APPJAR=target/*.jar
# COPY ${APPJAR} app.jar
# RUN jar -xf ./app.jar

# FROM openjdk:8-jre-alpine
# VOLUME /tmp
# ARG DEPENDENCY=target/dependency
# COPY --from=builder ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY --from=builder ${DEPENDENCY}/META-INF /app/META-INF
# COPY --from=builder ${DEPENDENCY}/BOOT-INF/classes /app
# ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.demo.DemoApplication"]


FROM openjdk:8-jdk-alpine  
ENV APP_FILE demo-0.0.1-SNAPSHOT.jar  
ENV APP_HOME /usr/app  
EXPOSE 3000  
COPY ./*.jar $APP_HOME/  
WORKDIR $APP_HOME  
ENTRYPOINT ["sh", "-c"]  
CMD ["exec java -jar $APP_FILE"]