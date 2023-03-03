FROM crashvb/base:22.04-202303031605@sha256:ffa63321cadb7fdc937508b2976c6f919576bcbe93122a27fded24343d818315 AS parent

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
