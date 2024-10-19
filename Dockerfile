FROM python:3.13.0-alpine3.20@sha256:92e0e7f0e119e631e5d08a77bab4e2f35a93c727057cae6528d58880f8e77f6e

# checkov:skip=CKV_DOCKER_3:"Allow root user"
# checkov:skip=CKV_DOCKER_2:"No healthcheck"

WORKDIR /app

COPY requirements.txt ./

RUN apk add --no-cache g++ musl-dev libffi-dev libstdc++ && \
    python -m venv venv && \
    venv/bin/pip install --no-cache-dir --upgrade pip && \
    venv/bin/pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt && \
    apk del g++ musl-dev libffi-dev

# python is located in venv/bin
