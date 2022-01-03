# Kubernetes: Networking

https://www.digitalocean.com/community/tutorials/how-to-inspect-kubernetes-networking
https://wiki.alpinelinux.org/wiki/Package_management
https://gist.github.com/BretFisher/5e1a0c7bcca4c735e716abf62afad389

* TOC
{:toc}

## Gather k8s pod & service details
Pod Cluster IP
```
k get pod -o wide
```

Svc IP
```
k get service --all-namespaces
```

## Identify the PID of container on k8s node
List Containers on Node
```bash
docker ps
```

Get PID of container
```
PID="$(docker inspect --format '{{ .State.Pid }}' $CONTAINER_ID)"
echo $PID
```

## Build and run container with tools to inspect
```bash
docker build -t k8s-tools KUBERNETES-RESOURCES/tools-image && docker run -d k8s-tools:latest
```

## Run a script to dump details
```bash
chmod +x ./KUBERNETES-RESOURCES/networking/inspect.sh
./KUBERNETES-RESOURCES/networking/inspect.sh
```


