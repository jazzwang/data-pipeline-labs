# Fluentd (td-agent version) for Debian 9 (Stretch)
#
# Reference:
#    - http://docs.fluentd.org/articles/install-by-deb
#    - https://github.com/William-Yeh/docker-fluentd
#
# Also installed plugins:
#    - https://github.com/fluent/fluent-plugin-kafka

# pull base image
FROM debian:9
MAINTAINER Jazz Wang <jazzwang.tw@gmail.com>

RUN echo "deb http://packages.treasuredata.com/3/debian/stretch/ stretch contrib" > /etc/apt/sources.list.d/td-agent.list && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update  && \
    apt-get install -y -q --allow-unauthenticated --no-install-recommends td-agent build-essential libmariadb-dev && \
    cp /etc/td-agent/td-agent.conf  /etc/td-agent/td-agent.conf.bak  && \
    td-agent-gem install \
        fluent-plugin-mysql-replicator \
        --no-rdoc --no-ri  && \
    apt-get autoremove --purge -y build-essential && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/sbin/td-agent"]
