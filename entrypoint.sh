#!/bin/bash

set -o errexit

RECORD=""
if [[ "$CYPRESS_RECORD_KEY" -ne "" ]]; then
    RECORD=" --record"
fi

if [[ $# -eq 0 ]]; then
    cypress run -q $RECORD
else
    eval "$@"
fi
