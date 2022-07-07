FROM alpine
RUN apk update && \
    apk add --no-cache bash git yq github-cli
WORKDIR /gitkit
COPY . ./
ENTRYPOINT ["./deploy.sh"]
