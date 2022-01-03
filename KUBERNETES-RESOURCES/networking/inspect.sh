#!/bin/bash

# Set vars
# Set tools container
TOOLS_CONATINER=1d4fb342ff42
# Set k8s container id
CONTAINER_ID=26fb2e130e67
# IP to inspect
NODE_IP=10.1.0.11

# Set the PID for container we want to inspect
PID="$(docker inspect --format '{{ .State.Pid }}' $CONTAINER_ID)"

# Cmd to execute in ns
NS_PREFIX="nsenter -t $PID"

# In case we need to run as root
AS_ROOT="-u 0"

# Cmd we want to run in the ns
IP_ADDR="$NS_PREFIX ip addr"
CONN_TRK_DEST_="$NS_PREFIX conntrack -L -d $NODE_IP"

declare -a CMDS=("$IP_ADDR" "$CONN_TRK_DEST_")

for CMD in "${CMDS[@]}"
do
   echo "$CMD"
   docker exec $TOOLS_CONATINER $CMD
done
