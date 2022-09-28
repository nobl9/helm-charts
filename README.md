# Nobl9 helm charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/nobl9)](https://artifacthub.io/packages/search?repo=nobl9)

Collection of helm charts to use with Nobl9.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add nobl9 https://nobl9.github.io/helm-charts
```

You can then run `helm search repo nobl9` to see the charts.

More information on each chart can be found in the chart's README.

## Available Charts
- [Nobl9 Agent](https://github.com/nobl9/helm-charts/tree/main/charts/nobl9-agent) - Agent to retrieve SLI metrics from configured data sources and send the data back to the Nobl9 backend.

## License

[Mozilla Public License 2.0](https://github.com/nobl9/helm-charts/blob/main/LICENSE).
