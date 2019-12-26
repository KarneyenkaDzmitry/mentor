FROM golang as builder
COPY web.go .
# RUN go get -d -v

RUN GOOS=linux GOARCH=386 go build -a -o ./bin/web
RUN ls
RUN pwd
RUN ls /go/bin

FROM scratch
COPY --from=builder /go/bin ./bin
# RUN ls
# RUN ls ./bin
# RUN pwd
CMD ["./bin/web"]
EXPOSE 8080