FROM golang:1.21-rc-alpine AS build
WORKDIR /go/src
COPY full-cycle.go .
RUN go build full-cycle.go


FROM scratch
COPY --from=build /go/src/full-cycle .
CMD ["./full-cycle"]

