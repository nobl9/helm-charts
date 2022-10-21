# nobl9-agent

Agent to retrieve SLI metrics from configured data sources and send the data back to the Nobl9 backend.

## Getting started

Find the latests documentation at the [docs.nobl9.com](https://docs.nobl9.com/Nobl9_Agent/helm-charts?_highlight=helm#helm-chart-configuration)

## Required values

* `clientId` - the individual Nobl9 client identificator, may be provided using [config.clientId](./values.yaml#L72) or [deployment.extraEnvs](./values.yaml#L13)
* `clientSecret` - the individual Nobl9 client secret, may be provided using [config.clientSecret](./values.yaml#L74) or [deployment.extraEnvs](./values.yaml#L13)
* data source dependent variables - some of data sources requires additional variables to work with Nobl9 Agent, for example Splunk requires `splunk_observability_access_token`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.allowedUrls | string | `nil` | Populates N9_ALLOWED_URLS that limits the URLs which an Agent is able to query |
| config.authServer | string | `"auseg9kiegWKEtJZC416"` | Nobl9 Auth Server ID |
| config.clientId | string | `nil` | Nobl9 Client ID, creates secret with this value, leave empty and use deployment.extraEnvs to load from existing Secret |
| config.clientSecret | string | `nil` | Nobl9 Client secret, creates secret with this value, leave empty and use deployment.extraEnvs to load from existing Secret |
| config.datasourceName | string | `nil` | Nobl9 Data Source name |
| config.intakeUrl | string | `"https://app.nobl9.com/api/input"` | Nobl9 API URL |
| config.oktaOrgUrl | string | `"https://accounts.nobl9.com"` | Nobl9 Okta Organization URL |
| config.organization | string | `nil` | Nobl9 Organization name |
| config.project | string | `nil` | Nobl9 Project name |
| deployment.annotations | object | `{}` | Custom annotations |
| deployment.extraEnvs | string | `nil` | Additional Envs |
| deployment.image | string | `"nobl9/agent"` | Image used by chart |
| deployment.pullPolicy | string | `"Always"` | Image Pull Policy |
| deployment.version | string | `"0.53.2"` | Agent version (image tag) |
| extraLabels | object | `{}` |  |
| namespaceOverride | string | `nil` | Override the Namespace |
| resources.limits.cpu | string | `"1.0"` | CPU limit |
| resources.limits.memory | string | `"1Gi"` | Memory limit |
| resources.requests.cpu | string | `"0.1"` | CPU request |
| resources.requests.memory | string | `"350Mi"` | Memory request |
| secret.extraData | string | `nil` | Extra stringData to be included in secret, use deployment.extraEnvs to load as deployment Envs |
| secret.nameOverride | string | `nil` | Override the Secret name |
| securityContext.allowPrivilegeEscalation | bool | `false` | Grants container a privileged status if set to true |
| securityContext.readOnlyRootFilesystem | bool | `true` | ReadOnly file system mode if set to true |
| securityContext.runAsNonRoot | bool | `true` | Runs the container as a root user if set to false |
| securityContext.runAsUser | int | `2000` | Runs the container with specified PID |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nobl9 | <support@nobl9.com> | <https://nobl9.com> |
