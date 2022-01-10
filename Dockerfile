FROM docker.io/golang:1.17-alpine3.14 AS builder
WORKDIR /go/src/app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o /go/bin/greet ./cmd/greet/

FROM docker.io/alpine:3.14
COPY  --from=builder /go/bin/greet .

ENTRYPOINT [ "./greet" ]
