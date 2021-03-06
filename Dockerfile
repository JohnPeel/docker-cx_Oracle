FROM python:alpine
MAINTAINER John Peel "john@dgby.org"

RUN apk add --no-cache build-base musl-dev libnsl libaio \
 && pip install --upgrade pip setuptools \
 && ln /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1

ENV INSTANTCLIENT instantclient_11_2
ENV ORACLE_BASE /usr/lib/${INSTANTCLIENT}
ENV LD_LIBRARY_PATH /usr/lib/${INSTANTCLIENT}
ENV TNS_ADMIN /usr/lib/${INSTANTCLIENT}
ENV ORACLE_HOME /usr/lib/${INSTANTCLIENT}

ADD https://dgby.org/~john/.oracle/instantclient-basiclite-linux.x64-11.2.0.4.0.zip /
RUN unzip /instantclient-*.zip \
 && rm /instantclient-*.zip \
 && mv ${INSTANTCLIENT} /usr/lib/