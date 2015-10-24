#!/bin/bash

set -e

# Create Virtual env
virtualenv -p /opt/dev/.pyenv/versions/stackless-2.7.8/bin/python /opt/dev/venv/
. /opt/dev/venv/bin/activate

# Install dependency
cd /opt/dev/src
python setup.py develop

# Replace env variable in config file (docker linked container)
envsubst < /opt/dev/conf/config_original.cfg > /opt/dev/conf/config.cfg

# Check if additional packages.sh file exists
if [[ -f /opt/dev/conf/packages ]]
then
    . /opt/dev/conf/packages
fi

# Launch the project
exec "$@"
