ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache python3 py3-pip py3-usb

RUN pip3 install weewx
RUN pip3 install git+https://github.com/felddy/weewx-home-assistant@v1.0.0

COPY run.sh /
RUN chmod 777 /run.sh

CMD [ "/run.sh" ]