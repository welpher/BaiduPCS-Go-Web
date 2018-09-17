FROM node:8-alpine as build-stage
WORKDIR /webbuild
COPY ./frontend/package*.json ./
RUN npm install
COPY ./frontend/* .
RUN npm run build

FROM node:8-alpine
RUN mkdir app
WORKDIR /app
COPY --from=0 /webbuild/dist .
ADD ./backend/package.json /app

RUN npm i

ADD ./backend/* /app
RUN chmod u+x ./BaiduPCS-Go

CMD [ "npm", "start" ]