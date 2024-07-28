#!/bin/bash

ENV_NAME="$1"
EXPECTED_KEYFILE_NAME="./mesh$ENV_NAME"

if [ ! -f "$EXPECTED_KEYFILE_NAME" ]; then
    ssh-keygen -t ed25519 -f $EXPECTED_KEYFILE_NAME -C mesh${ENV_NAME}@db.mesh.nycmesh.net -q -N ""
else
    echo "File $EXPECTED_KEYFILE_NAME already exists"
fi
