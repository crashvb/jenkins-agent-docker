# jenkins-agent-docker

[![version)](https://img.shields.io/docker/v/crashvb/jenkins-agent/latest)](https://hub.docker.com/repository/docker/crashvb/jenkins-agent)
[![image size](https://img.shields.io/docker/image-size/crashvb/jenkins-agent/latest)](https://hub.docker.com/repository/docker/crashvb/jenkins-agent)
[![linting](https://img.shields.io/badge/linting-hadolint-yellow)](https://github.com/hadolint/hadolint)
[![license](https://img.shields.io/github/license/crashvb/jenkins-agent-docker.svg)](https://github.com/crashvb/jenkins-agent-docker/blob/master/LICENSE.md)

## Overview

Alpine image with jre and docker-cli.

## Entrypoint Scripts

None.

## Standard Configuration

### Container Layout

```
/
├─ etc/
│  ├─ entrypoint.d/
│  └─ healthcheck.d/
│     └─ jshell
├─ home/
│  └─ jenkins/
│     ├─ agent/
│     └─ .jenkins
└─ usr/
   └─ share/
      └─ jenkins/
```

### Exposed Ports

None.

### Volumes

* `/home/jenkins/agent` - Jenkins agent working directory.
* `/home/jenkins/.jenkins` - Jenkins agent cache.

## Development

[Source Control](https://github.com/crashvb/jenkins-agent-docker)

