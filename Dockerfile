FROM golang:alpine AS builder

WORKDIR /build

COPY . .
RUN go build -o go-gin-example .

FROM alpine

WORKDIR /build
COPY --from=builder /build/go-gin-example /build/go-gin-example

EXPOSE 8000
CMD ["./go-gin-example"]