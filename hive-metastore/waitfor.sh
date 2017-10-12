#!/bin/bash
until (mysql -h"$1" -P"$2" -uroot -p"${MYSQL_ROOT_PASSWORD}" -e "select 1") &> /dev/null; do echo -n "."; sleep 1; done
