FROM alpine:3.7
RUN apk --no-cache add curl
ARG HELM_VERSION=3.1.2
RUN curl -sSL https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar xvz && \
  mv linux-amd64/helm /usr/bin/helm && \
  rm -rf linux-amd64
ARG HELMFILE_VERSION=0.112.0
RUN curl -sSL https://github.com/roboll/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_linux_amd64 -o /bin/helmfile && \
  chmod 0755 /bin/helmfile
RUN apk add --no-cache docker