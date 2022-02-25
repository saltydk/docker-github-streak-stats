FROM ubuntu:focal

WORKDIR /app

RUN apt-get update && apt-get install git php php-curl composer && rm -rf /tmp/*

RUN git clone https://github.com/DenverCoder1/github-readme-streak-stats.git

WORKDIR /app/github-readme-streak-stats

RUN composer install

COPY . .

WORKDIR /app/github-readme-streak-stats

CMD composer start
