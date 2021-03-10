# tycho-api

![Version: 0.1.11](https://img.shields.io/badge/Version-0.1.11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: develop-v0.0.53](https://img.shields.io/badge/AppVersion-develop--v0.0.53-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| app.name | string | `"tycho-api"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| createHomeDirs | bool | `true` |  |
| extraEnv | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| global.stdnfsPvc | string | `"stdnfs"` |  |
| global.tycho_api_service_name | string | `"tycho-api"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"helxplatform/tycho-api"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| parent_dir | string | `"/home"` |  |
| podAnnotations | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| runAsRoot | bool | `true` |  |
| service.ip_none | bool | `true` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"tycho-api"` |  |
| shared_dir | string | `"shared"` |  |
| subpath_dir | string | `nil` |  |
| useClusterRole | bool | `false` |  |
| useRole | bool | `true` |  |
| useSparkServiceAccount | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)