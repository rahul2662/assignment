# NGINX HELM CHART

Basic nginx helm chart to setup nginx in kubernetes. Prerequisites are given below.

## TL;DR
## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

Issue Faced with Helm 

Error: template: nginx/templates/svc.yaml:23:13: executing "nginx/templates/svc.yaml" at <eq .Values.service.type "LoadBalancer">: error calling eq: incompatible types for comparison

Not just this but same issue was on multiple places to fix this there are 2 ways

1. Dont give type as NIL in service in values.yaml. Specify some value 
2. Introduce checks to check NIL and keep it optional(opted this)

{{- if  ne (kindIs "invalid" $svcType) true -}} 
 - added this block wherever comparison was made.

 Checked with helm dry run command