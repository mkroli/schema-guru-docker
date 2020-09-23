FROM openjdk:8 AS builder
ENV ZIPFILE schema_guru_0.6.2.zip
ADD http://dl.bintray.com/snowplow/snowplow-generic/${ZIPFILE} /tmp/${ZIPFILE}
RUN unzip -d /opt /tmp/${ZIPFILE}

FROM openjdk:8
COPY --from=builder /opt/* /opt/
RUN ln -s /opt/* /opt/schema-guru
WORKDIR /schema
VOLUME /schema
ENTRYPOINT ["/opt/schema-guru"]
