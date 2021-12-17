# ReplicaSets

* TOC
{:toc}

Get rs in a namespace
```
k get rs -n <ns_name>
```

What images are specified in replicaset?
```
k get rs <rs_name> -o=jsonpath={.spec.template.spec.containers[*].image}
```
