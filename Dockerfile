FROM crashvb/base:24.04-202508010159@sha256:f7b3a015c749980c2427241686134908e4f82e2c0b72688dac37cb59e4e05169 AS parent

FROM jenkins/agent:alpine-jdk17@sha256:4390c5fa71e14347b733510e9b659c6e57df40545abf509ea082459ba4655a0f
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:4390c5fa71e14347b733510e9b659c6e57df40545abf509ea082459ba4655a0f" \
	org.opencontainers.image.base.name="jenkins/agent:alpine-jdk17" \
	org.opencontainers.image.created="${org_opencontainers_image_created}" \
	org.opencontainers.image.description="The 'Official Jenkins Agent Base Docker image' with the docker-cli package." \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.source="https://github.com/crashvb/jenkins-agent-docker" \
	org.opencontainers.image.revision="${org_opencontainers_image_revision}" \
	org.opencontainers.image.title="crashvb/jenkins-agent-docker" \
	org.opencontainers.image.url="https://github.com/crashvb/jenkins-agent-docker"

# hadolint ignore=DL3002
USER root

# Install packages, download files ...
COPY --from=parent /sbin/healthcheck /sbin/
COPY --from=parent /usr/local/lib/entrypoint.sh /usr/local/lib/
# hadolint ignore=DL3018
RUN apk add --no-cache docker-cli

# Configure: entrypoint
ENV EP_RUN=/var/local/container_initialized
# hadolint ignore=SC2174
RUN echo "Container initialized during build" > "${EP_RUN}" && \
	mkdir --mode=0755 --parents /etc/healthcheck.d/

# Configure: healthcheck
COPY healthcheck.jshell /etc/healthcheck.d/jshell

HEALTHCHECK CMD /sbin/healthcheck

ARG user=jenkins
USER ${user}
