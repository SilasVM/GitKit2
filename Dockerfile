FROM alpine

RUN apk update && \
    apk add --no-cache bash yq github-cli git
