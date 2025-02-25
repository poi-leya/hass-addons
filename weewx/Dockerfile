ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache git py3-pip py3-usb python3 \
  && pip3 install --break-system-packages weewx git+https://github.com/felddy/weewx-home-assistant@v1.0.0 \
  && apk del git \
  && mkdir /config \
  && mkdir /data

COPY run.sh /
RUN chmod 777 /run.sh

CMD [ "/run.sh" ]