FROM  golang:1.18-buster  AS build


WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o /docker-GoViolin

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /app/templates  ./templates/
COPY --from=build /app/img  ./img/
COPY --from=build /app/mp3  ./mp3/
COPY --from=build /app/css  ./css/
COPY --from=build /docker-GoViolin /docker-GoViolin


EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/docker-GoViolin"]