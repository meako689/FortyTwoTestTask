# A single container to publish/run your app on a server

FROM node:15-alpine AS frontend
WORKDIR /app
ADD ./frontend /app
RUN yarn install && yarn build

FROM python:3-alpine
WORKDIR /app
ADD . /app
RUN apk update \
    && pip install gunicorn \
    && pip install -r requirements/base.txt \
    && rm -rf /var/cache/apk/*
COPY --from=frontend /app ./frontend
RUN python manage.py collectstatic --noinput

CMD docker/backend-cmd.sh
