FROM mhart/alpine-node:6

WORKDIR /project

ARG PORT
ARG NODE_ENV

ENV PORT ${PORT:-3000}
EXPOSE $PORT

# Add node_modules/.bin to PATH
ENV PATH /project/node_modules/.bin:$PATH

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN adduser -h /project -S nodejs && \
    addgroup -S nodejs && \
    addgroup nodejs nodejs

USER nodejs

ENV NODE_ENV ${NODE_ENV:-production}

ENTRYPOINT ["npm", "start", "-s", "--"]

