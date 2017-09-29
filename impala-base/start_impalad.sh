#!/bin/bash
echo "Waiting for impala statestore to be ready" 
until (echo -n > /dev/tcp/${IMPALA_STATESTORE_HOST}/25010) &> /dev/null; do echo -n "."; sleep 1; done
echo "Waiting for impala catalog to be ready" 
until (echo -n > /dev/tcp/${IMPALA_CATALOG_HOST}/25020) &> /dev/null; do echo -n "."; sleep 1; done
source /etc/impala/impala.conf
/usr/bin/impalad ${IMPALA_SERVER_ARGS}
