# Original author: Pterodactyl Software
# Updated by 502Network
FROM    openjdk:11-alpine

LABEL   author='502Network' maintainer='abuse@honoka.club'

RUN         apk add --update --no-cache curl ca-certificates openssl git tar bash sqlite fontconfig tzdata \
            && adduser -D -h /home/container container \
            && ln -s /etc/localtime /etc/timezone

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]