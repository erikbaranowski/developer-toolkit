#!/bin/bash
#
# Recursively search a directory for .river files and format them.
#
# Example Command: /mnt/c/workspace/developer-toolkit/grafana/agent/util/agentfmt.sh /home/erik/go/src/agent /mnt/c/workspace/developer-toolkit

AGENT_REPO_DIR=$1
TARGET_DIR=$2

cd $AGENT_REPO_DIR
# go run ./cmd/grafana-agent fmt -w /mnt/c/workspace/config/grafana-agent/format.river

find "$TARGET_DIR" -name "*.river" -print0 | while read -d $'\0' file
do
    go run ./cmd/grafana-agent fmt -w $file
done