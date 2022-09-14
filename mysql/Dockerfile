FROM mysql/mysql-server:5.6
WORKDIR /docker-entrypoint-initdb.d
ENV LANG=C.UTF-8

LABEL author="Err0r"

# copy
COPY ./src /tmp
RUN cp /tmp/init.sql .

#
#    cp /tmp/my.cnf /etc/my.cnf && \
#    cp /tmp/flag /flag && \
#    cp /tmp/clean.sh /clean.sh

# challenge
#RUN chmod 777 /usr/lib64/mysql/plugin/


# install
#RUN yum update -y && \
#    yum install -y gcc


# flag
#RUN chmod 700 /flag

# clean
RUN rm -rf /tmp/*
#    yum install crontabs -y && \
#    echo "*/10 * * * * root bash /clean.sh"> /etc/cron.d/mysql && \
#    chmod 0644 /etc/cron.d/mysql && \
#    chmod +x /clean.sh && \
#    crontab /etc/cron.d/mysql && \
#    crond
