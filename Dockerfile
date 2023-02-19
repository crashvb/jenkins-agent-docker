FROM jenkins/agent:alpine-jdk11@sha256:aabedf170a30b7f3b255c679a895a8f7dfcd712f5f51f5309c8f9957ba6e2264
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:aabedf170a30b7f3b255c679a895a8f7dfcd712f5f51f5309c8f9957ba6e2264" \
	org.opencontainers.image.base.name="jenkins/agent:alpine-jdk11" \
	org.opencontainers.image.created="${org_opencontainers_image_created}" \
	org.opencontainers.image.description="The 'Official Jenkins Agent Base Docker image' with the docker-cli package." \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.source="https://github.com/crashvb/jenkins-agent-docker" \
	org.opencontainers.image.revision="${org_opencontainers_image_revision}" \
	org.opencontainers.image.title="crashvb/jenkins-agent-docker" \
	org.opencontainers.image.url="https://github.com/crashvb/jenkins-agent-docker"

ARG user=jenkins

USER root

# Install packages, download files ...
RUN apk add --no-cache docker-cli

USER ${user}
