# roger

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.3](https://img.shields.io/badge/AppVersion-1.0.3-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://airflow-helm.github.io/charts | airflow | v7.15.0 |
| https://charts.bitnami.com/bitnami | redis | 12.7.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| airflow.airflow.config.AIRFLOW__API__AUTH_BACKEND | string | `"airflow.api.auth.backend.deny_all"` |  |
| airflow.airflow.config.AIRFLOW__CORE__LOAD_EXAMPLES | string | `"False"` |  |
| airflow.airflow.config.AIRFLOW__CORE__SECURE_MODE | string | `"True"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__DAGS_VOLUME_SUBPATH | string | `"roger"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__DELETE_WORKER_PODS | string | `"TRUE"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__ENV_FROM_CONFIGMAP_REF | string | `"airflow-env-config"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__GIT_BRANCH | string | `"develop"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__GIT_DAGS_FOLDER_MOUNT_POINT | string | `"/opt/airflow/dags"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__GIT_REPO | string | `"https://git@github.com/helxplatform/roger.git"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__GIT_SYNC_DEST | string | `"roger"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__WORKER_CONTAINER_REPOSITORY | string | `"helxplatform/airflow"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__WORKER_CONTAINER_TAG | string | `"develop-v0.0.3"` |  |
| airflow.airflow.config.AIRFLOW__WEBSERVER__BASE_URL | string | `"http://localhost:8080/airflow"` |  |
| airflow.airflow.config.AIRFLOW__WEBSERVER__EXPOSE_CONFIG | string | `"False"` |  |
| airflow.airflow.config.AIRFLOW__WEBSERVER__RBAC | string | `"False"` |  |
| airflow.airflow.config.GUNICORN_CMD_ARGS | string | `"--log-level WARNING"` |  |
| airflow.airflow.configSecretsName | string | `"airflow-config-secrets"` |  |
| airflow.airflow.executor | string | `"KubernetesExecutor"` |  |
| airflow.airflow.extraEnv[0].name | string | `"AIRFLOW__CORE__FERNET_KEY"` |  |
| airflow.airflow.extraEnv[0].valueFrom.secretKeyRef.key | string | `"fernet-key"` |  |
| airflow.airflow.extraEnv[0].valueFrom.secretKeyRef.name | string | `"airflow-config-secrets"` |  |
| airflow.airflow.extraEnv[1].name | string | `"ELASTIC_SEARCH_PASSWORD_SECRET"` |  |
| airflow.airflow.extraEnv[1].value | string | `"dug-secrets"` |  |
| airflow.airflow.extraEnv[2].name | string | `"ELASTIC_SEARCH_PASSWORD_SECRET_KEY"` |  |
| airflow.airflow.extraEnv[2].value | string | `"ELASTIC_PASSWORD"` |  |
| airflow.airflow.extraEnv[3].name | string | `"REDIS_PASSWORD_SECRET"` |  |
| airflow.airflow.extraEnv[3].value | string | `"roger-redis-secret"` |  |
| airflow.airflow.extraEnv[4].name | string | `"REDIS_PASSWORD_SECRET_KEY"` |  |
| airflow.airflow.extraEnv[4].value | string | `"redis-password"` |  |
| airflow.airflow.extraVolumeMounts[0].mountPath | string | `"/dags/roger/data"` |  |
| airflow.airflow.extraVolumeMounts[0].name | string | `"roger-data"` |  |
| airflow.airflow.extraVolumes[0].emptyDir | object | `{}` |  |
| airflow.airflow.extraVolumes[0].name | string | `"roger-data"` |  |
| airflow.airflow.image.repository | string | `"helxplatform/airflow"` |  |
| airflow.airflow.image.tag | string | `"develop-v0.0.3"` |  |
| airflow.dags.git.gitSync.enabled | bool | `true` |  |
| airflow.dags.git.gitSync.refreshTime | int | `60` |  |
| airflow.dags.git.ref | string | `"develop"` |  |
| airflow.dags.git.repoHost | string | `"github.com"` |  |
| airflow.dags.git.url | string | `"https://git@github.com/helxplatform/roger.git"` |  |
| airflow.dags.installRequirments | bool | `true` |  |
| airflow.ingress.web.path | string | `"/airflow"` |  |
| airflow.postgresql.enabled | bool | `true` |  |
| airflow.redis.enabled | bool | `false` |  |
| airflow.web.service.type | string | `"ClusterIP"` |  |
| airflow.workers.replicas | int | `0` |  |
| elasticSearch.host | string | `"dug-elasticsearch"` |  |
| elasticSearch.port | int | `9200` |  |
| redis.cluster.slaveCount | int | `1` |  |
| redis.clusterDomain | string | `"blackbalsam-cluster"` |  |
| redis.existingSecret | string | `"roger-redis-secret"` |  |
| redis.existingSecretPasswordKey | string | `"redis-password"` |  |
| redis.image.repository | string | `"redislabs/redisgraph"` |  |
| redis.image.tag | string | `"2.2.14"` |  |
| redis.master.command | string | `""` |  |
| redis.master.extraFlags[0] | string | `"--loadmodule /usr/lib/redis/modules/redisgraph.so"` |  |
| redis.master.livenessProbe.enabled | bool | `false` |  |
| redis.master.readinessProbe.enabled | bool | `false` |  |
| redis.redis.command | string | `"redis-server"` |  |
| redis.slave.command | string | `""` |  |
| redis.slave.extraFlags[0] | string | `"--loadmodule /usr/lib/redis/modules/redisgraph.so"` |  |
| redis.slave.livenessProbe.enabled | bool | `false` |  |
| redis.slave.readinessProbe.enabled | bool | `false` |  |
| redis.usePassword | bool | `true` |  |
| tranql.gunicorn.workerCount | int | `4` |  |
| tranql.gunicorn.workerTimeout | int | `300` |  |
| tranql.image | string | `"renciorg/tranql-app"` |  |
| tranql.imageTag | string | `"develop-test"` |  |
| tranql.port | int | `8081` |  |
| tranql.replicas | int | `1` |  |
| tranql.service.type | string | `"ClusterIP"` |  |
| web.ambassador.airflowUI.map_name | string | `"airflow-ui-amb"` |  |
| web.ambassador.airflowUI.prefix | string | `"/airflow"` |  |
| web.ambassador.airflowUI.rewrite | string | `"/airflow/"` |  |
| web.ambassador.tranql.map_name | string | `"tranql-amb"` |  |
| web.ambassador.tranql.prefix | string | `"/tranql"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
