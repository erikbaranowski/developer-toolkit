# Grafana Agent Modules

This folder contains example modules and entrypoint config files for the
Grafana Agent. The primary driver for inputs is done using environment
variables so that it can run out of the box with 0 edits.

# Entrypoints

Provided modules can be used independently by creating your own entrypoint
parent config or via a provided entrypoint parent config. Environment variables
control the entrypoints so the entrypoints need not be modified.

*NOTE: The entrypoint parent configs will make use of some but possibly not all
modules. In order to make the entrypoints fully configurable on which modules
to load, conditional component functionality will need to be added to Grafana
Agent first.*

Here are the exports as I have them in my .bashrc profile. Example values were
left where possible and REDACTED where not.

```bash
export AGENT_MODE="flow"
export AGENT_CONFIG_FOLDER="/mnt/c/workspace/developer-toolkit/grafana/agent/config"
export AGENT_LOG_LEVEL="debug"
export METRIC_URL="https://prometheus-us-central1.grafana.net/api/prom/push"
export METRIC_USERNAME="REDACTED"
export METRIC_PASSWORD="REDACTED"
export LOG_URL="https://REDACTED:REDACTED@logs-prod3.grafana.net/loki/api/v1/push"
export LOG_FILEPATH="/home/erik/logs/flow.log"
export TRACE_URL="https://tempo-us-central1.grafana.net:443"
export TRACE_USERNAME="REDACTED"
export TRACE_PASSWORD="REDACTED"
```

## `module.string` Entrypoint

`string.river` is an entrypoint parent config for using modules with the `module.string` module loader.
The contents of `module.string` are loaded using the `local.file` flow component.

Clone this repo and set the AGENT_CONFIG_FOLDER environment variable to the path to this folder.

The command to run the agent from the root of the project looks like this:

```bash
go run ./cmd/grafana-agent run ${AGENT_CONFIG_FOLDER}/string.river 2>${LOG_FILEPATH}
```

or if running an installed agent, something like this should work:

```bash
grafana-agent run ${AGENT_CONFIG_FOLDER}/string.river
```

## `module.file` Entrypoint

`file.river` is an entrypoint parent config for using modules with the `module.file` module loader.

Clone this repo and set the AGENT_CONFIG_FOLDER environment variable to the path to this folder.

The command to run the agent from the root of the agent project looks like this:

```bash
go run ./cmd/grafana-agent run ${AGENT_CONFIG_FOLDER}/file.river 2>${LOG_FILEPATH}
```

or if running an installed agent, something like this should work:

```bash
grafana-agent run ${AGENT_CONFIG_FOLDER}/file.river
```

## `module.git` Entrypoint

`git.river` is an entrypoint parent config for using modules with the `module.git` module loader.

Copy this entrypoint parent config and set the AGENT_CONFIG_FOLDER environment variable to the path to the config.

The command to run the agent from the root of the agent project looks like this:

```bash
go run ./cmd/grafana-agent run ${AGENT_CONFIG_FOLDER}/git.river 2>${LOG_FILEPATH}
```

or if running an installed agent, something like this should work:

```bash
grafana-agent run ${AGENT_CONFIG_FOLDER}/git.river
```