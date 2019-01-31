#!/bin/bash

#Update apt-get
sudo apt-get update

#Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh

#Run Jenkins
docker run --rm -d -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean

#Build the java project with Maven
docker run -it -v "$PWD":/app -w /app maven mvn clean install | tee my-build.log

#Create the docker image with Tomcat
docker build -f Dockerfile -t hello-world:1 .

#Run the container with the created image
docker run -d -p 80:8080 hello-world:1

#Echo some random sentence
echo "Now you can access your web application at the following url in the browser. http://localhost:80/webapp"