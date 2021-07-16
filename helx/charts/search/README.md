# search

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for Helx Search components. This chart installs Dug, TranQL , Airflow and Redis.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://airflow-helm.github.io/charts | airflow | 8.1.3 |
| https://charts.bitnami.com/bitnami | redis | 13.0.0 |
| https://helm.elastic.co | elasticsearch | 7.12.0 |
| https://helx-charts.github.io/charts/ | search-api | 0.1.1 |
| https://helx-charts.github.io/charts/ | search-ui | 0.1.0 |
| https://yaphetkg.github.io | tranql | 0.1.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| airflow.airflow.config.AIRFLOW__CORE__LOAD_EXAMPLES | string | `"FALSE"` |  |
| airflow.airflow.config.AIRFLOW__KUBERNETES__DELETE_WORKER_PODS | string | `"TRUE"` |  |
| airflow.airflow.config.AIRFLOW__SCHEDULER__SCHEDULE_AFTER_TASK_EXECUTION | string | `"FALSE"` |  |
| airflow.airflow.config.AIRFLOW__WEBSERVER__BASE_URL | string | `""` |  |
| airflow.airflow.configSecretsName | string | `"airflow-config-secrets"` |  |
| airflow.airflow.executor | string | `"KubernetesExecutor"` |  |
| airflow.airflow.extraEnv[0].name | string | `"ROGER_ELASTICSEARCH_HOST"` |  |
| airflow.airflow.extraEnv[0].value | string | `"helx-elasticsearch-master"` |  |
| airflow.airflow.extraEnv[10].name | string | `"AIRFLOW__CORE__FERNET_KEY"` |  |
| airflow.airflow.extraEnv[10].valueFrom.secretKeyRef.key | string | `"fernet-key"` |  |
| airflow.airflow.extraEnv[10].valueFrom.secretKeyRef.name | string | `"airflow-config-secrets"` |  |
| airflow.airflow.extraEnv[1].name | string | `"ROGER_ELASTICSEARCH_PASSWORD"` |  |
| airflow.airflow.extraEnv[1].valueFrom.secretKeyRef.key | string | `"password"` |  |
| airflow.airflow.extraEnv[1].valueFrom.secretKeyRef.name | string | `"helx-elastic-secret"` |  |
| airflow.airflow.extraEnv[2].name | string | `"ROGER_ELASTICSEARCH_USERNAME"` |  |
| airflow.airflow.extraEnv[2].valueFrom.secretKeyRef.key | string | `"username"` |  |
| airflow.airflow.extraEnv[2].valueFrom.secretKeyRef.name | string | `"helx-elastic-secret"` |  |
| airflow.airflow.extraEnv[3].name | string | `"ROGER_REDISGRAPH_HOST"` |  |
| airflow.airflow.extraEnv[3].value | string | `"helx-redis-master"` |  |
| airflow.airflow.extraEnv[4].name | string | `"ROGER_REDISGRAPH_GRAPH"` |  |
| airflow.airflow.extraEnv[4].value | string | `"test"` |  |
| airflow.airflow.extraEnv[5].name | string | `"ROGER_REDISGRAPH_PASSWORD"` |  |
| airflow.airflow.extraEnv[5].valueFrom.secretKeyRef.key | string | `"password"` |  |
| airflow.airflow.extraEnv[5].valueFrom.secretKeyRef.name | string | `"helx-redis-secret"` |  |
| airflow.airflow.extraEnv[6].name | string | `"ROGER_REDISGRAPH_PORT"` |  |
| airflow.airflow.extraEnv[6].value | string | `"6379"` |  |
| airflow.airflow.extraEnv[7].name | string | `"ROGER_DATA_DIR"` |  |
| airflow.airflow.extraEnv[7].value | string | `"/opt/airflow/share/data"` |  |
| airflow.airflow.extraEnv[8].name | string | `"ROGER_ELASTICSEARCH_NBOOST__HOST"` |  |
| airflow.airflow.extraEnv[8].value | string | `"nboost $ TODO compute this"` |  |
| airflow.airflow.extraEnv[9].name | string | `"ROGER_INDEXING_TRANQL__ENDPOINT"` |  |
| airflow.airflow.extraEnv[9].value | string | `"http://helx-tranql:8081/tranql/tranql/query?dynamic_id_resolution=true&asynchronous=false"` |  |
| airflow.airflow.extraVolumeMounts[0].mountPath | string | `"/opt/airflow/share/data"` |  |
| airflow.airflow.extraVolumeMounts[0].name | string | `"airflow-data"` |  |
| airflow.airflow.extraVolumes[0].name | string | `"airflow-data"` |  |
| airflow.airflow.extraVolumes[0].persistentVolumeClaim.claimName | string | `"search-data"` |  |
| airflow.airflow.image.pullPolicy | string | `"Always"` |  |
| airflow.airflow.image.repository | string | `"helxplatform/roger"` |  |
| airflow.airflow.image.tag | string | `"0.3.dev0"` |  |
| airflow.airflow.kubernetesPodTemplate.resources | object | `{}` |  |
| airflow.dags.gitSync.branch | string | `"master"` |  |
| airflow.dags.gitSync.enabled | bool | `true` |  |
| airflow.dags.gitSync.repo | string | `"https://github.com/helxplatform/roger.git"` |  |
| airflow.dags.gitSync.repoSubPath | string | `"dags"` |  |
| airflow.dags.gitSync.revision | string | `"HEAD"` |  |
| airflow.dags.gitSync.syncWait | int | `60` |  |
| airflow.enabled | bool | `true` |  |
| airflow.externalRedis.host | string | `"helx-redis-master"` |  |
| airflow.externalRedis.passwordSecret | string | `"helx-redis-secret"` |  |
| airflow.externalRedis.passwordSecretKey | string | `"password"` |  |
| airflow.flower.enabled | bool | `false` |  |
| airflow.ingress.web.path | string | `"/airflow"` |  |
| airflow.logs.path | string | `"/opt/airflow/share/logs"` |  |
| airflow.logs.persistence.accessMode | string | `"ReadWriteMany"` |  |
| airflow.logs.persistence.enabled | bool | `true` |  |
| airflow.logs.persistence.size | string | `"1Gi"` |  |
| airflow.logs.persistence.storageClass | string | `""` |  |
| airflow.redis.enabled | bool | `false` |  |
| airflow.web.extraPipPackages[0] | string | `"Flask-AppBuilder~=3.2.0"` |  |
| airflow.web.service.annotations."getambassador.io/config" | string | `"---\napiVersion: ambassador/v1\nkind: Mapping\nname: airflow-ui-amb\nprefix: /airflow\nservice: helx-web:8080\nambassador_id: ambassador-helx\nrewrite: /airflow/\n"` |  |
| airflow.web.webserverConfig.stringOverride | string | `"import os\nfrom flask_appbuilder.security.manager import AUTH_REMOTE_USER\nfrom airflow.configuration import conf\nfrom flask import g\nfrom flask import get_flashed_messages, request, redirect, flash\nfrom flask_appbuilder import expose\nfrom flask_appbuilder._compat import as_unicode\nfrom flask_appbuilder.security.views import AuthView\nfrom flask_login import login_user, logout_user\n\nfrom airflow.www.security import AirflowSecurityManager\n\nclass CustomAuthRemoteUserView(AuthView):\n  login_template = \"\"\n\n  @expose(\"/login/\")\n  def login(self):\n      if g.user is not None and g.user.is_authenticated:\n          return redirect(self.appbuilder.get_url_for_index)\n      username = request.environ.get('HTTP_REMOTE_USER')\n      if username:\n          # https://github.com/dpgaspar/Flask-AppBuilder/blob/55b0976e1450295d5a26a06d28c5b992fb0b561e/flask_appbuilder/security/manager.py#L1201\n          user = self.appbuilder.sm.auth_user_remote_user(username)\n          if user is None:\n              flash(as_unicode(self.invalid_login_message), \"warning\")\n          else:\n              login_user(user)\n      else:\n          flash(as_unicode(self.invalid_login_message), \"warning\")\n\n      # Flush \"Access is Denied\" flash messaage\n      get_flashed_messages()\n      return redirect(self.appbuilder.get_url_for_index)\n\n  @expose(\"/logout/\")\n  def logout(self):\n      logout_user()\n      return redirect(\"/admin/logout/\")\n\nclass CustomAirflowSecurityManager(AirflowSecurityManager):\n  authremoteuserview = CustomAuthRemoteUserView\n\nSECURITY_MANAGER_CLASS = CustomAirflowSecurityManager\n\nbasedir = os.path.abspath(os.path.dirname(__file__))\n# The SQLAlchemy connection string.\nSQLALCHEMY_DATABASE_URI = conf.get('core', 'SQL_ALCHEMY_CONN')\n# Flask-WTF flag for CSRF\nWTF_CSRF_ENABLED = True\nAUTH_TYPE = AUTH_REMOTE_USER\nAUTH_USER_REGISTRATION = False  # Set to True to allow users who are not already in the DB"` |  |
| airflow.workers.enabled | bool | `false` |  |
| elasticsearch.clusterName | string | `"helx-elasticsearch"` |  |
| elasticsearch.enabled | bool | `true` |  |
| elasticsearch.extraEnvs[0].name | string | `"ELASTIC_PASSWORD"` |  |
| elasticsearch.extraEnvs[0].valueFrom.secretKeyRef.key | string | `"password"` |  |
| elasticsearch.extraEnvs[0].valueFrom.secretKeyRef.name | string | `"helx-elastic-secret"` |  |
| elasticsearch.extraEnvs[1].name | string | `"ELASTIC_USERNAME"` |  |
| elasticsearch.extraEnvs[1].valueFrom.secretKeyRef.key | string | `"username"` |  |
| elasticsearch.extraEnvs[1].valueFrom.secretKeyRef.name | string | `"helx-elastic-secret"` |  |
| elasticsearch.imageTag | string | `"7.12.0"` |  |
| nboost.enabled | bool | `false` |  |
| persistence.pvcSize | string | `"1Gi"` |  |
| persistence.storageClass | string | `""` |  |
| redis.cluster.slaveCount | int | `1` |  |
| redis.clusterDomain | string | `"cluster.local"` |  |
| redis.configmap | string | `"# Disables appendonly , this instance is readonly. And needs to be\n# seeded from RDB files if needed.\nappendonly no\n# Disable RDB persistence, AOF persistence already enabled.\nsave \"\""` |  |
| redis.dumpUri | string | `"https://stars.renci.org/var/kgx_data/roger_graph.rdb"` |  |
| redis.enabled | bool | `true` |  |
| redis.existingSecret | string | `"helx-redis-secret"` |  |
| redis.existingSecretPasswordKey | string | `"password"` |  |
| redis.image.repository | string | `"redislabs/redisgraph"` |  |
| redis.image.tag | string | `"2.2.14"` |  |
| redis.master.command | string | `""` |  |
| redis.master.extraFlags[0] | string | `"--loadmodule /usr/lib/redis/modules/redisgraph.so"` |  |
| redis.master.livenessProbe.enabled | bool | `false` |  |
| redis.master.readinessProbe.enabled | bool | `false` |  |
| redis.master.resources.requests.cpu | string | `"200m"` |  |
| redis.master.resources.requests.memory | string | `"8Gi"` |  |
| redis.master.service.port | int | `6379` |  |
| redis.persistence.existingClaim | string | `"redis-data"` |  |
| redis.redis.command | string | `"redis-server"` |  |
| redis.slave.command | string | `""` |  |
| redis.slave.extraFlags[0] | string | `"--loadmodule /usr/lib/redis/modules/redisgraph.so"` |  |
| redis.slave.livenessProbe.enabled | bool | `false` |  |
| redis.slave.readinessProbe.enabled | bool | `false` |  |
| redis.slave.resources.requests.cpu | string | `"200m"` |  |
| redis.slave.resources.requests.memory | string | `"8Gi"` |  |
| redis.slave.service.port | int | `6379` |  |
| redis.usePassword | bool | `true` |  |
| search-api.elasticsearch.enabled | bool | `false` |  |
| search-api.enabled | bool | `true` |  |
| search-api.redis.enabled | bool | `false` |  |
| search-api.web.deployment.extraEnv[0].name | string | `"ELASTIC_API_HOST"` |  |
| search-api.web.deployment.extraEnv[0].value | string | `"helx-elasticsearch-master"` |  |
| search-api.web.deployment.extraEnv[1].name | string | `"ELASTIC_API_PORT"` |  |
| search-api.web.deployment.extraEnv[1].value | string | `"9200"` |  |
| search-api.web.deployment.extraEnv[2].name | string | `"ELASTIC_PASSWORD"` |  |
| search-api.web.deployment.extraEnv[2].valueFrom.secretKeyRef.key | string | `"password"` |  |
| search-api.web.deployment.extraEnv[2].valueFrom.secretKeyRef.name | string | `"helx-elastic-secret"` |  |
| search-api.web.deployment.extraEnv[3].name | string | `"ELASTIC_USERNAME"` |  |
| search-api.web.deployment.extraEnv[3].valueFrom.secretKeyRef.key | string | `"username"` |  |
| search-api.web.deployment.extraEnv[3].valueFrom.secretKeyRef.name | string | `"helx-elastic-secret"` |  |
| search-api.web.deployment.extraEnv[4].name | string | `"REDIS_HOST"` |  |
| search-api.web.deployment.extraEnv[4].value | string | `"helx-redis-master"` |  |
| search-api.web.deployment.extraEnv[5].name | string | `"REDIS_PASSWORD"` |  |
| search-api.web.deployment.extraEnv[5].valueFrom.secretKeyRef.key | string | `"password"` |  |
| search-api.web.deployment.extraEnv[5].valueFrom.secretKeyRef.name | string | `"helx-redis-secret"` |  |
| search-api.web.deployment.extraEnv[6].name | string | `"REDIS_PORT"` |  |
| search-api.web.deployment.extraEnv[6].value | string | `"6379"` |  |
| search-api.web.deployment.extraEnv[7].name | string | `"NBOOST_API_HOST"` |  |
| search-api.web.deployment.extraEnv[7].value | string | `"nboost $ TODO compute this"` |  |
| search-api.web.service.annotations."getambassador.io/config" | string | `"---\napiVersion: ambassador/v1\nkind: Mapping\nname: search-api\nprefix: /search\nservice: helx-search-api-webserver:5551\nrewrite: /search\nambassador_id: ambassador-helx\ncors:\n  origins: \"*\"\n  methods: POST, OPTIONS\n  headers:\n    - Content-Type\n---\napiVersion: ambassador/v1\nkind: Mapping\nname: search-api-kg\nprefix: /search_kg\nservice: helx-search-api-webserver:5551\nambassador_id: ambassador-helx\nambassador_id: ambassador-helx\nrewrite: /search_kg\ncors:\n  origins: \"*\"\n  methods: POST, OPTIONS\n  headers:\n    - Content-Type\n"` |  |
| search-ui.extraEnv[0].name | string | `"PUBLIC_URL"` |  |
| search-ui.extraEnv[0].value | string | `"/ui"` |  |
| search-ui.service.annotations."getambassador.io/config" | string | `"---\napiVersion: ambassador/v1\nkind: Mapping\nname: search-ui\nprefix: /ui\nservice: helx-search-ui:8080\nambassador_id: ambassador-helx\n"` |  |
| secrets.elastic.name | string | `"helx-elastic-secret"` |  |
| secrets.elastic.passwordKey | string | `"password"` |  |
| secrets.elastic.user | string | `"elastic"` |  |
| secrets.elastic.userKey | string | `"username"` |  |
| secrets.redis.name | string | `"helx-redis-secret"` |  |
| secrets.redis.passwordKey | string | `"password"` |  |
| tranql.annotations."getambassador.io/config" | string | `"apiVersion: ambassador/v1\nkind: Mapping\nname: tranql-amb\nprefix: /tranql\nrewrite: /tranql\nservice: helx-tranql:8081\nambassador_id: ambassador-helx\ncors:\n  origins: \"*\"\n  methods: POST, OPTIONS\n  headers:\n    - Content-Type\ntimeout_ms: 0\n"` |  |
| tranql.enabled | bool | `true` |  |
| tranql.existingRedis.host | string | `"helx-redis-slave"` |  |
| tranql.existingRedis.port | int | `6379` |  |
| tranql.existingRedis.secret | string | `"helx-redis-secret"` |  |
| tranql.existingRedis.secretPasswordKey | string | `"password"` |  |
| tranql.extraEnv[0].name | string | `"WEB_PATH_PREFIX"` |  |
| tranql.extraEnv[0].value | string | `"/tranql"` |  |
| tranql.redis.enabled | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
