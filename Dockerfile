FROM python:3.12.6-alpine3.20

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
