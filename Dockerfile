FROM index.docker.io/golang:1.17-alpine3.14 AS builder
WORKDIR /go/src/app

ENV BREAKING_CHANGE

COPY go.mod go.sum ./
RUN sleep 20s && exit 1

COPY . .
RUN go build -o /go/bin/greet ./cmd/greet/

FROM index.docker.io/alpine:3.14
COPY  --from=builder /go/bin/greet .

RUN chown 65534:65534 /greet

USER 65534

ENTRYPOINT [ "./greet" ]
