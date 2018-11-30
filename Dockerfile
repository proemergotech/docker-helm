FROM alpine

# Note: Latest version of helm may be found at:
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v2.11.0"

RUN apk add --no-cache ca-certificates git \
    && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && helm init --client-only \
    && helm plugin install https://github.com/hypnoglow/helm-s3.git \
    && mkdir -p /app

WORKDIR /app
