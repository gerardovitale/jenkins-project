#!/bin/bash

docker cp centos/script.sh jenkins:/tmp/script.sh
docker cp centos/remote-key jenkins:/tmp/remote-key
docker exec -u root jenkins bash -c "chown 1000:1000 /tmp/remote-key"
