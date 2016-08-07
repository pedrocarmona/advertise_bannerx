FROM elixir:1.3.2
MAINTAINER Pedro Carmona @pedrocarmona
ENV REFRESHED_AT 2016-07-02

RUN mkdir /app
COPY . /app
VOLUME /app

WORKDIR /app

RUN yes y | mix local.hex
RUN mix deps.get

# iex -S mix
CMD mix run --no-halt -e AdvertiseBannerx.run

EXPOSE 8080