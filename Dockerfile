FROM python:3.9.0b4-alpine3.12

# RUN apt-get update && apt-get -y install cron vim

RUN apk update && apk add cron vim

WORKDIR /app

COPY crontab /etc/cron.d/crontab

COPY hello.py /app/hello.py

RUN chmod 0644 /etc/cron.d/crontab

RUN chmod +x hello.py

RUN /usr/bin/crontab /etc/cron.d/crontab

# run crond as main process of container
CMD ["cron", "-f"]


