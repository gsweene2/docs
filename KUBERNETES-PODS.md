# Kubernetes: Pods

* TOC
{:toc}

Getting started: what should I alias
```
alias k=kubernetes
```

List pods all namespaces
```
k get pods --all-namespaces
```

Count pods in all namespaces
```
k get pods --all-namespaces --output json | jq -j '.items | length'
```

Create deployment with specific image (`nginx`)
```
kubectl create deployment nginx --image=nginx
```

Get image(s) from deployment
```
k get deploy <deploy_name> -o=jsonpath={.spec.template.spec.containers[*].image}
````

Get image(s) from pod
```
k get pod <pod_name> -o=jsonpath={.spec.containers[*].image}
```

List pods with name of nodes
```
k get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaces
```

Get status of each container in pod
```
k get pod <pod_name> -o=jsonpath='{range .status.containerStatuses[*]}{"\nImage: "}{.image}{"\nName: "}{.name}{"\nState: "}{.state}{"\n"}'
```

Create a pod from an image
```
k run <pod_name> --image=<image>
```
