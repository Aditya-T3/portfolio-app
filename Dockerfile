# taking the nginx as base image based on alphine linux os
FROM nginx:alpine                               
#copies the html file to the target location inside nginx container
COPY index.html /usr/share/nginx/html/index.html