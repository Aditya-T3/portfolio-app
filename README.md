This is a simple devops project of to create a basic portfolio web application and then to  containerize it using Docker, build a CI/CD pipeline using Jenkins that pulls code from GitHub, builds the Docker image, and runs it in the respective port

STEPS:
1) I have created a html page with my portfolio details.
2) I created a Dockerfile to containerize it in nginx container and then pushed to github
3) After this, we create a Jenkins Pipeline file which does the process of cloning the github repository, building the docker image and then running the container using that portfolio image generated.

In Jenkins, the following plugins are needed:
1) Git 
2) Pipeline
3) Docker Pipeline

Important:
1) Install Jenkins via Docker. Also ensure that Docker is installed in the Jenkins Container without which the docker image cannot be built.
2) make sure to logined as 'root user' , else there will be issued regarding denied permission.
3) Use the following command to create a new jenkins container with docker access:

docker run -d \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts

4) when port is opened it asks for administrator password. you can generate this by giving the command "docker exec <container name> cat /var/jenkins_home/secrets/initialAdminPassword" in the terminal.
5) First ensure all the required piplines are installed. Now, while creating the pipeline: 
In the config page:
Pipeline → Definition: Pipeline script from SCM
SCM: Git
Repository URL: https://github.com/Aditya-T3/portfolio-app.git
Branch: main
Script Path: jenkins/Jenkinsfile

Save this and click Build Now to start the pipeline, and the deployed portfolio website will be shown on http://localhost:8081 in the browser.