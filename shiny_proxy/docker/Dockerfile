FROM openjdk:8-jre

RUN mkdir -p /opt/shinyproxy/
RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.3.0.jar -O /opt/shinyproxy/shinyproxy.jar
COPY application.yml /source/application.yml

WORKDIR /opt/shinyproxy/
CMD ["/bin/bash", "-c", "java -jar /opt/shinyproxy/shinyproxy.jar"]
