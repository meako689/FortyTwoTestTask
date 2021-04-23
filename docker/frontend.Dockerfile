FROM node:15-alpine

WORKDIR /app
COPY . /app
RUN yarn --cwd /app/frontend install

CMD docker/frontend-cmd.sh
