#!/bin/bash
for ((i=1;i<=9999;i++)); do
  mysql --defaults-extra-file=/app/root.cnf -u root myweb -e "insert into search_test(text) values('$i')"
done
