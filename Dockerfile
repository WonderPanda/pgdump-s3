FROM postgres:12-alpine

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install awscli
RUN mkdir /backup

# RUN apk add --no-cache py3-pip && pip install awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY backup.sh /usr/local/bin/backup
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD /usr/local/bin/entrypoint
