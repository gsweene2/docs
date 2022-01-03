# Kubernetes: Networking

* TOC
{:toc}

Pod Cluster IP
```
k get pod -o wide
```

Svc IP
```
k get service --all-namespaces
```

List Containers on Node
```bash
docker ps
```

Get PID of container
```
CONTAINER_ID=26fb2e130e67
PID="$(docker inspect --format '{{ .State.Pid }}' $CONTAINER_ID)"
echo $PID
```

Install ip with brew
```
brew install iproute2mac
```

Spin up alpine container
Install iproute2
nsenter ip addr
```
docker run -it --privileged --pid=host alpine

# In Container
apk update && apk add iproute2

# Set PID
PID=55749
CMD="ip addr"
nsenter -t $PID -n $CMD
```
