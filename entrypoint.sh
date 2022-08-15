#!/bin/bash

set -o errexit

RECORD=""
if [[ "$CYPRESS_RECORD_KEY" != "" ]]; then
    RECORD=" --record"
fi

if [[ $# -eq 0 ]]; then
    gosu cypress cypress run -q $RECORD
else
    gosu cypress eval "$@"
fi
