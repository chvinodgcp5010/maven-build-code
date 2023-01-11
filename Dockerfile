#stage1
FROM openjdk:8 AS BUILD_IMAGE
RUN apt update && apt install maven -y
#RUN git clone -b vp-docker https://github.com/imranvisualpath/vprofile-repo.git
RUN git clone https://github.com/chvinodgcp5010/maven-build-code.git
RUN cd maven-build-code && mvn install

#stage2
FROM tomcat:8-jre11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=BUILD_IMAGE vprofile-repo/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
