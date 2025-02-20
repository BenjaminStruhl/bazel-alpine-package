FROM alpine
COPY . /app
WORKDIR /app
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN apk upgrade
RUN apk add abuild
RUN abuild-keygen -a -n
# RUN abuild -F checksum && abuild -F -r

