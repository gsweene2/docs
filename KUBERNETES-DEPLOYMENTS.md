# Kubernetes: Deployments

* TOC
{:toc}

Get deployments in current namespace
```
k get deploy
```

Count deployments in current namespace
```
k get deploy --output json | jq -j '.items | length'
```

List all images for all deployments in current namespace
```
k get deploy -o=jsonpath={.items[*].spec.template.spec.containers[*].image}
```

Create deployment from image
```
k create deployment <deploy_name> --replicas=1 --image=some_image
```
