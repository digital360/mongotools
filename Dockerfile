FROM golang:alpine as golang

ENV GOROOT=/usr/local/go
ENV GOPATH=/go

RUN apk add --no-cache \
    git

RUN git clone https://github.com/mongodb/mongo-tools.git /usr/local/go/src/github.com/mongodb/mongo-tools

RUN cd /usr/local/go/src/github.com/mongodb/mongo-tools && \
    . ./set_goenv.sh && set_goenv

RUN cd /usr/local/go/src/github.com/mongodb/mongo-tools && \
    go build -o /usr/local/bin/mongorestore mongorestore/main/mongorestore.go
