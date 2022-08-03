FROM node:16

ENV PORT=8080

RUN apt-get -y update
RUN apt-get install -y wget lsb-release sudo ffmpeg

RUN curl -Lf# https://github.com/homebridge/ffmpeg-for-homebridge/releases/latest/download/ffmpeg-debian-$(uname -m).tar.gz | sudo tar xzf - -C / --no-same-owner

COPY ./setup.sh /setup.sh
COPY ./docker-entrypoint.sh ./docker-entrypoint.sh

RUN /setup.sh

RUN apt-get -y update
RUN apt install -y hoobsd hoobs-cli hoobs-gui

RUN apt-get clean all

CMD [ "./docker-entrypoint.sh" ]