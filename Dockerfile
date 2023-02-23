FROM docker.io/library/golang:1.19 AS build

WORKDIR /app

COPY . /app

RUN go build -o app app.go

FROM docker.io/library/ubuntu:22.04

COPY --from=build /app/app /app/app
