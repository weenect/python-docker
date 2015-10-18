#!/bin/bash

set -e

# Create Virtual env
virtualenv /opt/dev/venv/
. /opt/dev/venv/bin/activate

# Install dependency
cd /opt/dev/src
python setup.py develop

# Replace env variable in config file (docker linked container)
envsubst < /opt/dev/conf/config_original.cfg > /opt/dev/conf/config.cfg

# Launch the project
exec "$@"

