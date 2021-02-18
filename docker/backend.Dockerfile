FROM python:3-alpine

WORKDIR /app
ADD . /app

RUN apk update \
    && apk add make supervisor \
    && pip install gunicorn \
    && pip install -r requirements/base.txt \
    && echo "files = /app/docker/conf/supervisor.ini" >> /etc/supervisord.conf \
    && rm -rf /var/cache/apk/*

CMD docker/backend-cmd.sh
