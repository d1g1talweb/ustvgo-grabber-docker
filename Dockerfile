FROM ghcr.io/linuxserver/baseimage-alpine:3.14

# copy local files
COPY . /

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
  python3-dev \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
  py3-pip \
  python3 \
 pip install -r requirements.txt
 crontab crontab

VOLUME /iptv

CMD ["crond", "-f"]
