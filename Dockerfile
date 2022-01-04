FROM jenkins/agent:alpine-jdk11@sha256:c7c5f0ab586ec65d45ded96380bd8fe92a9c2a24912d8d7f7dfde99abfed19dc
LABEL maintainer "Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.description="This is the 'Official Jenkins Agent Base Docker image' with the docker-cli package." \
	org.opencontainers.image.licenses="Apache" \
	org.opencontainers.image.source="https://github.com/crashvb/jenkins-agent-docker" \
	org.opencontainers.image.title="Alpine Jenkins agent with docker CLI." \
	org.opencontainers.image.vendor="Richard Davis" \
	org.opencontainers.image.url="https://github.com/crashvb/jenkins-agent-docker"

ARG user=jenkins

USER root

# Install packages, download files ...
RUN apk add --no-cache docker-cli

USER ${user}
