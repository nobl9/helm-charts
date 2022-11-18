{{- define "nobl9-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nobl9-agent.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "nobl9-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "nobl9-agent.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Allow the secret name to be overridden
*/}}
{{- define "nobl9-agent.secret.name" -}}
  {{- if .Values.secret.nameOverride -}}
    {{- .Values.secret.nameOverride -}}
  {{- else -}}
    {{ template "nobl9-agent.fullname" . }}
  {{- end -}}
{{- end -}}

{{/*
Create the name of the service account
*/}}
{{- define "nobl9-agent.serviceAccountName" -}}
  {{- if .Values.serviceAccount.create -}}
    {{- default (include "nobl9-agent.fullname" .) .Values.serviceAccount.name -}}
  {{- else -}}
    {{- default "default" .Values.serviceAccount.name -}}
  {{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "nobl9-agent.labels" -}}
helm.sh/chart: {{ include "nobl9-agent.chart" . }}
{{ include "nobl9-agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.extraLabels }}
{{ toYaml .Values.extraLabels }}
{{- end }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "nobl9-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nobl9-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Values.config.datasourceName }}
nobl9.com/agent-datasource-name: {{ .Values.config.datasourceName }}
{{- end }}
{{- if .Values.config.project }}
nobl9.com/agent-project: {{ .Values.config.project }}
{{- end }}
{{- if .Values.config.organization }}
nobl9.com/agent-organization: {{ .Values.config.organization }}
{{- end }}
{{- end -}}
