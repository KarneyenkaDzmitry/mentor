FROM golang as builder
COPY web.go .
RUN GOOS=linux GOARCH=386 go build -a -o ./bin/web

FROM scratch
COPY --from=builder /go/bin ./bin
CMD ["./bin/web"]
EXPOSE 8080

# FROM golang as builder
# COPY web.go .
# RUN GOOS=linux GOARCH=386 go build -a -o ./bin/app

# FROM scratch
# COPY --from=builder /go/bin ./
# CMD ["./app" ]
# EXPOSE 8080