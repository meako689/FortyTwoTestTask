FROM python:3-alpine

WORKDIR /app
COPY . /app

# gcc, libc-dev are flake8 (typed-ast) deps
RUN apk update \
    && apk add make gcc libc-dev \
    && pip install -r requirements/dev.txt \
    && rm -rf /var/cache/apk/*

CMD docker/backend-cmd.sh
