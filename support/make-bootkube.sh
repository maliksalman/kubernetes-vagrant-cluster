#!/bin/bash -x

go get -u github.com/kubernetes-incubator/bootkube
cd $(go env GOPATH | cut -d: -f1)/src/github.com/kubernetes-incubator/bootkube
make cross

cd ..
mv bootkube /tmp/external/kubernetes-incubator-bootkube
cp -r /tmp/external/support/rook.io /tmp/external/kubernetes-incubator-bootkube/hack/
cp /tmp/external/support/Vagrantfile /tmp/external/kubernetes-incubator-bootkube/hack/multi-node/
cp /tmp/external/support/bootkube-up /tmp/external/kubernetes-incubator-bootkube/hack/multi-node/