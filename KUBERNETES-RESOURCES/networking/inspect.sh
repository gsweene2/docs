#!/bin/bash

# Set vars
# Set tools container
TOOLS_CONATINER=$1
echo "TOOLS_CONTAINER: $TOOLS_CONATINER"
# Set k8s container id
CONTAINER_ID=$2
echo "CONTAINER_ID: $CONTAINER_ID"
# IP to inspect
NODE_IP=$3
echo "NODE_IP: $NODE_IP"
# KUBE_DNS_CIP
KUBE_DNS_CIP=$4
echo "KUBE_DNS_CIP: $KUBE_DNS_CIP"

# # Set the PID for container we want to inspect
# PID="$(docker inspect --format '{{ .State.Pid }}' $CONTAINER_ID)"

# Cmd to execute in ns
NS_PREFIX="nsenter -t $PID"

# In case we need to run as root
AS_ROOT="-u 0"

# Cmd we want to run in the ns
NS_IP_ADDR="$NS_PREFIX ip addr"
IP_ADDR="ip addr"
# NS_CONN_TRK_DEST_="$NS_PREFIX conntrack -L -d $NODE_IP"
# CONN_TRK_DEST_="conntrack -L -d $NODE_IP"
# NS_IPTABLES="$NS_PREFIX iptables -t nat -L KUBE-SERVICES"
IPTABLES="iptables -t nat -L KUBE-SERVICES"
IPTABLES_SAVE="iptables-save"
NS_KUBE_DNS_CIP="$NS_PREFIX -n dig kubernetes.default.svc.cluster.local @$KUBE_DNS_CIP"

declare -a CMDS=("$NS_IP_ADDR" "$IP_ADDR" "$IPTABLES" "$IPTABLES_SAVE" "$NS_KUBE_DNS_CIP")

for CMD in "${CMDS[@]}"
do
  echo ""
  EXEC="docker exec -u 0 $TOOLS_CONATINER $CMD"
  echo "$EXEC"
  $EXEC
  echo ""
done
