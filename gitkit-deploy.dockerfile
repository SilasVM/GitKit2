FROM alpine
RUN apk update && \
    apk add --no-cache bash git yq github-cli

# FIX: for https://github.com/orgs/community/discussions/55820
# Update this when there is a better solution.
RUN git config --global http.version HTTP/1.1

WORKDIR /gitkit
COPY . ./
ENTRYPOINT ["./deploy.sh"]
