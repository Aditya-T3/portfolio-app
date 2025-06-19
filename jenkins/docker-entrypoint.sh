#!/bin/bash

# Get the group ID of the Docker socket
DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)

# Create docker group with that GID (if not already exists)
groupadd -for -g "$DOCKER_GID" docker

# Add jenkins user to that group
usermod -aG "$DOCKER_GID" jenkins

# Print confirmation
echo "Added jenkins to group with GID $DOCKER_GID"

# Now run the original Jenkins entrypoint (as Jenkins user)
exec su jenkins -c "/usr/bin/tini -- /usr/local/bin/jenkins.sh"
