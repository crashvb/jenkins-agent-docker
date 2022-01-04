# jenkins-agent-docker

## Overview

Alpine image with jre and docker-cli.

## Entrypoint Scripts

None.

## Healthcheck Scripts

None.

## Standard Configuration

### Container Layout

```
/
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

