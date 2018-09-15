FROM node:8-alpine as build-stage
WORKDIR /frontend/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

RUN cd ../backend

FROM node:8-alpine
RUN mkdir app
WORKDIR /backend/app
ADD package.json /app

RUN npm i

ADD . /app
RUN chmod u+x ./BaiduPCS-Go

CMD [ "npm", "start" ]