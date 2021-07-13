{{/*
Expand the name of the chart.
*/}}
{{- define "search.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Renders a value that contains template.
Usage:
{{ include "search.redis.tplValue" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "search.redis.tplValue" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "search.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "search.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "search.labels" -}}
helm.sh/chart: {{ include "search.chart" . }}
{{ include "search.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "search.selectorLabels" -}}
app.kubernetes.io/name: {{ include "search.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "search.elasticsearch.fullname" -}}
{{- $name := default "elasticsearch" .Values.elasticsearch.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "search.elasticsearch.uname" -}}
{{- if empty .Values.elasticsearch.fullnameOverride -}}
{{- if empty .Values.elasticsearch.nameOverride -}}
{{ .Values.elasticsearch.clusterName }}-{{ .Values.elasticsearch.nodeGroup }}
{{- else -}}
{{ .Values.elasticsearch.nameOverride }}-{{ .Values.elasticsearch.nodeGroup }}
{{- end -}}
{{- else -}}
{{ .Values.elasticsearch.fullnameOverride }}
{{- end -}}
{{- end -}}

{{/*
Get the elasticsearch password secret.
*/}}
{{- define "search.elasticsearch.secretName" -}}
{{- if .Values.elasticsearch.existingSecret -}}
{{- printf "%s" .Values.elasticsearch.existingSecret -}}
{{- else -}}
{{- printf "%s" (include "search.elasticsearch.fullname" .) -}}
{{- end -}}
{{- end -}}


{{/*
Get the username key to be retrieved from elasticsearch secret.
*/}}
{{- define "search.elasticsearch.secretUsernameKey" -}}
{{- if and .Values.elasticsearch.existingSecret .Values.elasticsearch.existingSecretUsernameKey -}}
{{- printf "%s" .Values.elasticsearch.existingSecretUsernameKey -}}
{{- else -}}
{{- printf "elasticsearch-username" -}}
{{- end -}}
{{- end -}}

{{/*
Get the password key to be retrieved from elasticsearch secret.
*/}}
{{- define "search.elasticsearch.secretPasswordKey" -}}
{{- if and .Values.elasticsearch.existingSecret .Values.elasticsearch.existingSecretPasswordKey -}}
{{- printf "%s" .Values.elasticsearch.existingSecretPasswordKey -}}
{{- else -}}
{{- printf "elasticsearch-password" -}}
{{- end -}}
{{- end -}}
