# Probes

* TOC
{:toc}

## Readiness Probe Example

Example: An app that depends on a downstream service being available

1. Create a upstream application `upstream-nginx` that depends on a downstream

  ```
  k apply -f KUBERNETES-RESOURCES/upstream-nginx-deployment.yaml
  ```

2. Demonstrate that the service is failing

  ```
  k get pod
  ```

3. Create the downstream deployment and service, `downstream-httpd-deployment` and `downstream-httpd-service`

  ```
  k apply -f KUBERNETES-RESOURCES/downstream-httpd-deployment.yaml
  k apply -f KUBERNETES-RESOURCES/downstream-httpd-service.yaml
  ```

4. Confirm that the upstream service is now available

  ```
  k get pod
  ```
