FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y apache2 \
    php

EXPOSE 80

ENTRYPOINT service apache2 start && /bin/bash