#!/bin/bash

# Get GID of Docker socket on the host
DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)

# Create docker group with that GID (ignore if it already exists)
groupadd -for -g "$DOCKER_GID" docker

# Add jenkins user to docker group
usermod -aG "$DOCKER_GID" jenkins

echo "Jenkins user added to Docker group with GID $DOCKER_GID"

# Start Jenkins as jenkins user
exec su jenkins -c "/usr/bin/tini -- /usr/local/bin/jenkins.sh"
