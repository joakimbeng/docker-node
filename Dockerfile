FROM mhart/alpine-node:7

WORKDIR /project

# Add node_modules/.bin to PATH
ENV PATH /project/node_modules/.bin:$PATH

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh tzdata

RUN adduser -h /project -S nodejs && \
    addgroup -S nodejs && \
    addgroup nodejs nodejs

USER nodejs

CMD ["npm", "start", "-s", "--"]

