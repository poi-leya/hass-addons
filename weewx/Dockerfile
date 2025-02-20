ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add python3-pip python3-venv python3-usb libusb-1.0-0

RUN python3 -m venv ~/weewx-venv
RUN source ~/weewx-venv/bin/activate
RUN python3 -m pip install weewx
RUN pip install git+https://github.com/felddy/weewx-home-assistant@v1.0.0

COPY run.sh /
RUN chmod 777 /run.sh

CMD [ "/run.sh" ]