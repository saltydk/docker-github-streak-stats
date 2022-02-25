FROM ubuntu:focal

ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /app

ENV TZ="Etc/UTC" LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8" UMASK="002"

RUN apt-get update && apt-get install git php php-curl composer -y && apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN git clone https://github.com/DenverCoder1/github-readme-streak-stats.git

WORKDIR /app/github-readme-streak-stats

RUN composer install

COPY . .

WORKDIR /app/github-readme-streak-stats

CMD composer start
