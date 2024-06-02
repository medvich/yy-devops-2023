FROM ubuntu:20.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y wget curl && \
    apt autoremove -y && \
    wget https://storage.yandexcloud.net/final-homework/bingo && \
    mv bingo /bin/bingo && \
    chmod 755 /bin/bingo && \
    adduser yy --shell /bin/bash && \
    usermod -aG sudo yy && \
    mkdir -p /opt/bongo/logs/cf3fc6afb6/ && \
    touch /opt/bongo/logs/cf3fc6afb6/main.log && \
    chmod 777 -R /opt/bongo/

USER yy

WORKDIR /home/yy

RUN bingo print_default_config > config.yaml && \
    sed -i -e 's/test@example.com/sergey66rt@gmail.com/g' config.yaml

USER root

WORKDIR /opt/bingo

RUN mv /home/yy/config.yaml .

USER yy

CMD ["bingo", "run_server"]