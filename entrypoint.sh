#!/bin/bash

set -o errexit

RECORD=""
if [[ "$CYPRESS_RECORD_KEY" != "" ]]; then
    RECORD=" --record"
fi

chown cypress:cypress /app/test

if [[ $# -eq 0 ]]; then
    gosu cypress cypress run -q $RECORD
else
    gosu cypress $@
fi
