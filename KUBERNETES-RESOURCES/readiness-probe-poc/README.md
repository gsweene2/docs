
# Create resources

```bash
k apply -f downstream-nodejs-deployment.yaml
k apply -f downstream-nodejs-service.yaml

k apply -f upstream-nginx-deployment.yaml
k apply -f upstream-nginx-service.yaml
```

# The exercise

Scale down the downstream service
```
k scale deploy downstream-nodejs --replicas=0
```
Get the upstream pod name
```
k get pod
```
Describe the upstream pod
```
k describe pod upstream-nginx-*
```
Look for the error
```
Warning  Unhealthy  1s (x6 over 4m31s)  kubelet            Readiness probe failed:
```

# Delete resources

```bash
k delete -f downstream-nodejs-deployment.yaml
k delete -f downstream-nodejs-service.yaml

k delete -f upstream-nginx-deployment.yaml
k delete -f upstream-nginx-service.yaml
```

# Optional 

## Step 1: Create Resources without readiness probes

```bash
NAME=upstream-nginx
IMAGE=nginx
PORT=80
REPLICAS=1
FILE_NAME=upstream-nginx-deployment-initial.yaml
k create deploy $NAME --image=$IMAGE --port=$PORT --replicas=$REPLICAS --dry-run=client -o yaml > $FILE_NAME

SVC_TYPE=loadbalancer
NAME=upstream-nginx
TCP=80:80
FILE_NAME=upstream-nginx-service-initial.yaml
k create service $SVC_TYPE $NAME --tcp=$TCP --dry-run=client -o yaml > $FILE_NAME

NAME=downstream-nodejs
IMAGE=heroku/nodejs-hello-world
PORT=3000
REPLICAS=1
FILE_NAME=downstream-nodejs-deployment-initial.yaml
k create deploy $NAME --image=$IMAGE --port=$PORT --replicas=$REPLICAS --dry-run=client -o yaml > $FILE_NAME

SVC_TYPE=clusterip
NAME=downstream-nodejs
TCP=3000:3000
FILE_NAME=downstream-nodejs-service-initial.yaml
k create service $SVC_TYPE $NAME --tcp=$TCP --dry-run=client -o yaml > $FILE_NAME
```

## Step 2

```bash
k apply -f downstream-nodejs-deployment-initial.yaml
k apply -f downstream-nodejs-service-initial.yaml

k apply -f upstream-nginx-deployment-initial.yaml
k apply -f upstream-nginx-service-initial.yaml
```
