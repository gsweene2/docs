
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