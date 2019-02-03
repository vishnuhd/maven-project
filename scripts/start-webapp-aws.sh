#!/bin/bash

#Update apt-get
sudo apt-get update

#Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh
sudo service docker start

#Run Jenkins
docker run -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkins/jenkins