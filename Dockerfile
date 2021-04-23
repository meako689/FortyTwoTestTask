# A single container to publish/run your app on a server

FROM node:15-alpine AS frontend
WORKDIR /app
ADD ./frontend /app
RUN yarn install && yarn build

FROM python:3-alpine
WORKDIR /app
ADD . /app
RUN apk update \
    && apk add make supervisor \
    && pip install gunicorn \
    && pip install -r requirements/base.txt \
    && echo "files = /app/docker/conf/supervisor.ini" >> /etc/supervisord.conf \
    && rm -rf /var/cache/apk/*
COPY --from=frontend /app ./frontend
RUN python manage.py collectstatic

CMD docker/backend-cmd.sh
