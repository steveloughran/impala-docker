#!/bin/bash

/usr/bin/waitfor.sh ${DB_HOST} ${DB_PORT} 
V=$(/opt/hive/bin/schematool -info -dbType mysql |  grep version | cut -d: -f2) 
NV=$(echo $V | tr ' ' '\n' | wc -l)
SAME=$(echo $V | tr ' ' '\n'  | uniq | wc -l)
if [[ -z "${V}" || "${NV}" != "2" ||  "${SAME}" != "1" ]];
then
    /opt/hive/bin/schematool  --dbType mysql --initSchema
fi
/opt/hive/bin/hive  --service metastore

