#!/bin/bash
#
# Recursively search a directory for .river files and format them.
#
# Example Command: /mnt/c/workspace/developer-toolkit/grafana/agent/util/agentfmt.sh /home/erik/go/src/agent /mnt/c/workspace/developer-toolkit

AGENT_REPO_DIR=$1
TARGET_DIR=$2

cd $AGENT_REPO_DIR
find "$TARGET_DIR" -name "*.river" -print0 | while read -d $'\0' file
do
    # This should probably be more clever than running the go project for every file but does the job for now...
    go run ./cmd/grafana-agent fmt -w $file
done