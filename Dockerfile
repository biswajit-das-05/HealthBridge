FROM tomcat:9.0-jdk17

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Railway port
EXPOSE 8080

# Tell Tomcat to use Railway PORT
ENV PORT=8080
ENV CATALINA_OPTS="-Dserver.port=${PORT}"

CMD ["catalina.sh", "run"]
