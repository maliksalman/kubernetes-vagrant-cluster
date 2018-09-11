#!/bin/bash -x

# compile bootkube binaries
go get -u github.com/kubernetes-incubator/bootkube
cd $(go env GOPATH | cut -d: -f1)/src/github.com/kubernetes-incubator/bootkube
make cross

# copy over the bootkube artifacts
cd ..
BOOTKUBE_DIR='/tmp/external/kubernetes-incubator-bootkube'
mv bootkube ${BOOTKUBE_DIR}

# override some bootkube files
cp /tmp/external/support/Vagrantfile ${BOOTKUBE_DIR}/hack/multi-node/
cp /tmp/external/support/bootkube-up ${BOOTKUBE_DIR}/hack/multi-node/

# copy over rook.io resources for persistent storage
cp -r /tmp/external/support/rook.io ${BOOTKUBE_DIR}/hack/

# enable the flex-volume plugin needed by rook.io
sed -i 's|--rotate-certificates|--rotate-certificates --volume-plugin-dir=/var/lib/kubelet/volumeplugins|' ${BOOTKUBE_DIR}/hack/multi-node/user-data.sample
