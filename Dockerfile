#see https://github.com/Blizzard/node-rdkafka/blob/master/examples/docker-alpine.md
# newer version (8.16) was causing the container to die after startup 

#FROM node:8.16.0-alpine
FROM node:8.13.0-alpine

RUN apk --no-cache add \
      bash \
      g++ \
      ca-certificates \
      lz4-dev \
      musl-dev \
      cyrus-sasl-dev \
      openssl-dev \
      make \
      python

RUN apk add --no-cache --virtual .build-deps gcc zlib-dev libc-dev bsd-compat-headers py-setuptools bash

# Create app directory
RUN mkdir -p /usr/local/app

# Move to the app directory
WORKDIR /usr/local/app

# Copy package.json
COPY package*.json ./

# Install
RUN npm ci

# Bundle app source
COPY . .

EXPOSE 8080

USER node

CMD [ "node", "index.js" ]
