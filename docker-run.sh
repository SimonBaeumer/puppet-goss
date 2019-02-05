#!/usr/bin/env bash

docker build -t puppet-selfcontained .
docker run -it \
    -h puppetselfcontained.example \
    -v $(pwd):/app \
    -v $(pwd):/etc/puppetlabs/code/modules/goss \
    puppet-selfcontained