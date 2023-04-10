FROM alpine as without-source
RUN apk add bats yq dos2unix

FROM alpine as with-source
RUN apk add bats yq dos2unix
COPY . /w
WORKDIR /w
