FROM python:3.13.1-alpine3.20@sha256:6076e7dcac32914517bb864f0327d94b204fca10e6fad5efc4f55ab75957704e

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
