# nobl9-agent

Agent to retrieve SLI metrics from configured data sources and send the data back to the Nobl9 backend.

## Getting started

To set up the chart, follow these steps:

1. Install **Helm** by following the steps described in the [Helm Documentation](https://helm.sh/docs/intro/quickstart/) and set up a connection to the desired Kubernetes cluster.
2. Add the Nobl9 repository by entering the following command:
   ```bash
   helm repo add nobl9 https://nobl9.github.io/helm-charts
   ```

   After entering the above-mentioned command, you can discover the available charts, for example:

   ```bash
   helm search repo Nobl9
   NAME                    CHART VERSION   APP VERSION     DESCRIPTION
   nobl9/nobl9-agent       1.0.0           0.48.0          Agent to retrieve SLI metrics from configured d...
   ```

3. Get the Agent variables from the [Nobl9 Agent configuration page](https://app.nobl9.com/integrations/sources) in the Nobl9 UI.

    > You can find the Agent variables in the Nobl9 App by navigating to the **Integrations** > **Sources** and choosing the data source created using the Agent connection method. The variables are presented in the **Agent Configuration** tab.

    > If there are no available data sources created using the Agent connection method in the **Sources** tab, you can create one by following the steps described in the [Agent Documentation](https://docs.nobl9.com/Nobl9_Agent/#creating-the-agent). For more Integration-specific details, refer to the **Agent Configuration in the UI** section in each [Integration’s subpage](https://docs.nobl9.com/Sources/).<br/>

4. Prepare the chart values.

    Review the default configuration and the default values in the [values.yaml](./values.yaml).

    You can extend this file with custom variables as needed. For example, if you want to add OpenTSDB as a data source, create new `values.yml` file and add the following values:

    ```bash
    config:
        clientId: my-id
        clientSecret: my-secret
    deployment:
        version: "0.51.2"
        extraEnvs:
          - name: N9_METRICS_PORT
            value: "9090"
    ```

    **Important notes:**

    * `clientId` and `clientSecret` values correspond to the `N9_CLIENT_ID` and `N9_CLIENT_SECRET` variables from the Agent Configuration.

    * Note that the OpenTSDB data source requires an additional [`N9_METRICS_PORT`](agent-metrics#agents-default-port) variable. The `N9_OKTA_ORG_URL` and `N9_AUTH_SERVER` variables can be omitted because these values are equal to the defaultsReview the default configuration and the default values in the [values.yaml](./values.yaml).

5. Deploy the chart by entering the following command:

   ```bash
   helm install --values values.yml --generate-name nobl9/nobl9-agent
   ```

   The expected output looks like this:

    ```bash
    NAME: nobl9-agent-1663143197
    LAST DEPLOYED: Wed Sep 14 10:13:20 2022
    NAMESPACE: default
    STATUS: deployed
    REVISION: 1
    TEST SUITE: None
    ```

Go to the [docs.nobl9.com](https://docs.nobl9.com/Nobl9_Agent/helm-charts?_highlight=helm#helm-chart-configuration) for more informations.

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
