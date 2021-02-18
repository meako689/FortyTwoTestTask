FROM node:15-alpine

WORKDIR /app
ADD . /app

CMD docker/frontend-cmd.sh
