# Grafana Agent Config

This folder contains an example configuration for the Grafana Agent using modules. The primary
driver for inputs is done using environment variables so that it can run out of the box with 0 edits.

## Usage

In order to use parent.river as an agent config file with no modifications,
you will need environment variables set up.

Here are the exports as I have them in my .bashrc profile. Example values were left where possible
and REDACTED where not.

```bash
export AGENT_MODE="flow"
export AGENT_CONFIG_FOLDER="/mnt/c/workspace/developer-toolkit/grafana/agent/config"
export AGENT_LOG_LEVEL="debug"
export PROMETHEUS_USERNAME="REDACTED"
export PROMETHEUS_PASSWORD="REDACTED"
export PROMETHEUS_TARGET="https://prometheus-us-central1.grafana.net/api/prom/push"
export PROMETHEUS_SCRAPE_URL="Erik-Work.local:9182"
export PROMETHEUS_SCRAPE_JOB_NAME="windows-laptop"
export LOKI_URL="https://REDACTED:REDACTED@logs-prod3.grafana.net/loki/api/v1/push"
export LOG_FILE_PATH="/home/erik/logs/flow.log"
export TEMPO_URL="https://tempo-us-central1.grafana.net:443"
export TEMPO_USERNAME="REDACTED"
export TEMPO_PASSWORD="REDACTED"
```

The command to run the agent from the root of the project looks like this

```bash
go run ./cmd/grafana-agent run ${AGENT_CONFIG_FOLDER}/parent.river 2>${LOG_FILE_PATH}
```

or if running an installed agent, something like this should work

```bash
grafana-agent run ${AGENT_CONFIG_FOLDER}/parent.river
```