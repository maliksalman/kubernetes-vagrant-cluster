#!/bin/bash

# cleanup first
rm -rf kubernetes-incubator-bootkube
rm -f cluster

# create docker image that will ready bootkube
docker run --user $(id -u):$(id -g) -e 'XDG_CACHE_HOME=/tmp/.cache' -i -t -v $PWD:/tmp/external golang /tmp/external/support/make-bootkube.sh

# run bootkube
(cd kubernetes-incubator-bootkube/hack/multi-node; ./bootkube-up)
ln -s kubernetes-incubator-bootkube/hack/multi-node/cluster