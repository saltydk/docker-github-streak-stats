FROM php:8

ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /app

ENV TZ="Etc/UTC"

RUN git clone https://github.com/DenverCoder1/github-readme-streak-stats.git

WORKDIR /app/github-readme-streak-stats

RUN composer install

COPY . .

WORKDIR /app/github-readme-streak-stats

CMD composer start
