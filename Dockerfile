FROM golang:1.14.1-alpine3.11 as build

ENV GO111MODULE=on

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

# final stage
FROM scratch
COPY --from=build /app/meterreadingserver /app/
EXPOSE 80
ENTRYPOINT ["/app/meterreadingserver"]