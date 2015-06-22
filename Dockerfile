FROM alpine
MAINTAINER dawi2332@gmail.com

EXPOSE 5432

VOLUME /var/lib/postgresql/data

ENV LANG de_DE.utf8
ENV PGDATA /var/lib/postgresql/data

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postgres"]

RUN apk add --update postgresql \
	&& rm -rf /var/cache/apk/*
COPY gosu /usr/local/bin/
COPY docker-entrypoint.sh /
COPY docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
