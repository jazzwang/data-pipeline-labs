#!/bin/bash
mysql --defaults-extra-file=/app/root.cnf -u root myweb -e "update search_test set text='39' where text = '38'"
mysql --defaults-extra-file=/app/root.cnf -u root myweb -e "update search_test set text='40' where text = '39'"
mysql --defaults-extra-file=/app/root.cnf -u root myweb -e "update search_test set text='41' where text = '40'"
