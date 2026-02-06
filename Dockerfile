FROM tomcat:9.0

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Replace Tomcat port 8080 with Railway PORT
RUN sed -i 's/port="8080"/port="${PORT}"/' /usr/local/tomcat/conf/server.xml

# Expose Railway port
EXPOSE ${PORT}

# Start Tomcat
CMD ["catalina.sh", "run"]
