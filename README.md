Creates a multi-node kubernetes cluster using vagrant and virtualbox.

### Requirements
- Docker
- Vagrant
- Virtualbox

### Creating a cluster

By default create a cluster with one master, one etcd, and one worker node. Each worker node is configured with 1024MB of memory and 1 virtual CPU.

```
./create-cluster.sh
```

Number of worker nodes and other attributes can be configured via enviornment variables. For example to run with 2 worker nodes each with 2048MB memory and 2 virtual CPUs, run the following:

```
export BOOTKUBE_WORKER_COUNT=2
export BOOTKUBE_WORKER_CPUS=2
export BOOTKUBE_WORKER_MEMORY=2048

./create-cluster.sh
```

### Destroying the cluster

```
./destroy-cluster.sh
```
