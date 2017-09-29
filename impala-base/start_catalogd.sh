#!/bin/bash
wait_metastore.sh
source /etc/impala/impala.conf
/usr/bin/catalogd ${IMPALA_CATALOG_ARGS}

