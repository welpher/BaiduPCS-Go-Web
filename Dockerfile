FROM node:8-alpine as build-stage
RUN cd ./frontend
RUN npm install
RUN npm run build

RUN cd ../backend

FROM node:8-alpine
RUN mkdir app
WORKDIR /app
ADD package.json /app

RUN npm i

ADD . /app
RUN chmod u+x ./BaiduPCS-Go

CMD [ "npm", "start" ]