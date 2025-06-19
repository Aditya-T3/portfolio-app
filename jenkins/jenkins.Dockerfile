FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Switch back to Jenkins user
USER jenkins

# Use custom entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
