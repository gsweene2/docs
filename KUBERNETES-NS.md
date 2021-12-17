# Kubernetes: Namespaces

* TOC
{:toc}

Get namespaces
```bash
k get ns
```

Count namespaces on system
```bash
k get ns -o json | jq '.items | length'
```

Count pods in a namespace
```bash
k get pods -n <ns_name> -o json | jq '.items | length'
```

Create a pod from image in a specific namespace
```bash
k run <pod_name> --image=<image> -n <ns>
```