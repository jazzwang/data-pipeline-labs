FROM fluent/fluentd:latest
RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev mariadb-dev \
 && sudo gem install \
             fluent-plugin-mysql-replicator \
 && sudo gem sources --clear-all \
 && apk del .build-deps sudo build-base ruby-dev mariadb-dev \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
