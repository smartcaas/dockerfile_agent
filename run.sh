#!/bin/bash
require_env=(
SERVER_HOST
SERVER_PORT
)
for i in ${require_env[@]}; do
    if [ x${!i} == 'x' ]; then
        echo "Need env ${i}"
        exit 1;
    fi
done
confFile=$GOPATH/src/github.com/dinp/agent/cfg.json
sed -i "s/{SERVER_HOST}/${SERVER_HOST}/g" $confFile \
&& sed -i "s/{SERVER_PORT}/${SERVER_PORT}/g" $confFile

cd $GOPATH/src/github.com/dinp/agent/
./agent
