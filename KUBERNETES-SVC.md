# Kubernetes: Services

* TOC
{:toc}

Count services in the default namespace
```bash
k get svc -o json | jq '.items | length'
```

How can I describe a service?
```bash
k describe svc <svc_name>
```
