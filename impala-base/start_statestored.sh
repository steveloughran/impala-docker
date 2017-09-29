#!/bin/bash
wait_metastore.sh
source /etc/impala/impala.conf
/usr/bin/statestored ${IMPALA_STATE_STORE_ARGS}


