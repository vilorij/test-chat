FROM erlang:alpine as builder
MAINTAINER Dmitry Skokov <dmitry.vilka@gmail.com>
WORKDIR /app
RUN apk add git

COPY . .
RUN rebar3 compile

FROM erlang:alpine
WORKDIR /chat
COPY startup.sh .
COPY priv ./priv
#COPY src ./src
#COPY include ./include
COPY --from=builder /app/_build/ ./app/

EXPOSE 8080

CMD [ "/chat/startup.sh"]

