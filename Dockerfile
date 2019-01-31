FROM tomcat:8

ADD webapp/target/*.war /usr/local/tomcat/webapps/