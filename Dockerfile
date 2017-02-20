FROM alpine
MAINTAINER oxoox22@gmail.com <Oxoox Soulmaneller>

RUN apk add --update nodejs
RUN npm i -g codeceptjs
RUN npm i -g webdriverio

WORKDIR /tests
CMD codeceptjs run
