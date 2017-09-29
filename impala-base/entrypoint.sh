#!/bin/bash

envsubst  \$IMPALA_CATALOG_HOST,\$IMPALA_STATESTORE_HOST < /etc/impala/impala.conf.template > /etc/impala/impala.conf

for i in  /etc/hadoop/conf.template/*
do
    F=$(basename $i)
    envsubst \$METASTORE_HOST,\$S3_DEFAULT_BUCKET,\$DB_HOST,\$DB_PORT,\$HIVE_DB,\$HIVE_USER,\$HIVE_PASSWORD  < $i > /etc/hadoop/conf/$F
    rm -f  /etc/hive/conf/$F
    rm -f /etc/impala/conf/$F
    ln -s /etc/hadoop/conf/$F /etc/hive/conf/$F
    ln -s /etc/hadoop/conf/$F /etc/impala/conf/$F
done

$@
