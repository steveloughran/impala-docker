#!/bin/bash
echo "Wating for Metastore to be ready"
until (echo -n > /dev/tcp/${METASTORE_HOST}/9083) &> /dev/null; do echo -n "."; sleep 1; done
$@

