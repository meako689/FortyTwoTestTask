FROM python:3-alpine

WORKDIR /app
ADD . /app

# gcc, libc-dev are flake8 (typed-ast) deps
RUN apk update \
    && apk add make supervisor gcc libc-dev \
    && pip install gunicorn \
    && pip install -r requirements/base.txt \
    && pip install -r requirements/dev.txt \
    && echo "files = /app/docker/conf/supervisor.ini" >> /etc/supervisord.conf \
    && rm -rf /var/cache/apk/*

CMD docker/backend-cmd.sh
