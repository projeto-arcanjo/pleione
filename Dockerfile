FROM kartoza/geoserver:2.15.2
MAINTAINER magno.mabreu@gmail.com

RUN mkdir /home/pleione
COPY ./cartas  /home/pleione/
RUN chmod 0777 /home/pleione/install-cartas.sh




