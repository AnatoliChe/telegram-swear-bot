FROM node:12
MAINTAINER Vladimir Iakovlev <nvbn.rm@gmail.com>

RUN adduser --disabled-password --gecos "" telegram-swear-bot
WORKDIR /home/telegram-swear-bot
USER telegram-swear-bot

COPY . /home/telegram-swear-bot/
USER root
RUN chown -R telegram-swear-bot /home/telegram-swear-bot/
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get  install -y vim screen locales locales-all
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen 
RUN sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
USER telegram-swear-bot
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU:en  
ENV LC_ALL ru_RU.UTF-8   
RUN yarn

CMD yarn start
