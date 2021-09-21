FROM golang:1.14 as builder
WORKDIR /go/src/github.com/Compass0228/hello-world/
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o /tmp/http-server .

FROM scratch
WORKDIR /root/
COPY --from=builder /tmp/http-server .
CMD ["./http-server"]
