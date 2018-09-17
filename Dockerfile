FROM node:8-alpine as builder
RUN mkdir webbuild
WORKDIR /webbuild
COPY frontend/ /webbuild/
RUN npm install
RUN npm run build

FROM node:8-alpine as prod
RUN mkdir app
WORKDIR /app
COPY --from=0 /webbuild/dist/ /app/dist/
copy backend/ /app/

RUN npm i

RUN chmod u+x ./BaiduPCS-Go

CMD [ "npm", "start" ]