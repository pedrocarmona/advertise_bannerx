FROM elixir:1.3.2
MAINTAINER Pedro Carmona @pedrocarmona
ENV REFRESHED_AT 2016-07-02

RUN apt-get -qq update
RUN apt-get install -y nginx inotify-tools

RUN mkdir /app
COPY . /app
VOLUME /app

WORKDIR /app

RUN yes y | mix local.hex
RUN mix deps.get

EXPOSE 8080

CMD ["mix", "run", "--no-halt"]
