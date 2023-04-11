FROM alpine as without-source
RUN apk add bats yq

FROM alpine as with-source
RUN apk add bats yq
COPY . /w
WORKDIR /w
