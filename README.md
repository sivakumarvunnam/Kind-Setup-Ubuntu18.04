
# Kind-Setup-Ubuntu18.04
Project to Setup Kubernetes IN Docker - local clusters for testing Kubernetes

kind is a tool for running local Kubernetes clusters using Docker container "nodes".  
kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

If you have [go] ([1.11+][go-supported]) and [docker] installed `GO111MODULE="on" go get sigs.k8s.io/kind@v0.7.0 && kind create cluster` is all you need!

kind consists of:
- Go [packages][packages] implementing [cluster creation][cluster package], [image build][build package], etc.
- A command line interface ([`kind`][kind cli]) built on these packages.
- Docker [image(s)][images] written to run systemd, Kubernetes, etc.
- [`kubetest`][kubetest] integration also built on these packages (WIP)

kind bootstraps each "node" with [kubeadm][kubeadm]. For more details see [the design documentation][design doc].

**NOTE**: kind is still a work in progress, see the [1.0 roadmap].

## Installation and usage

You can install kind with `GO111MODULE="on" go get sigs.k8s.io/kind@v0.7.0`.

**NOTE**: please use the latest go to do this, ideally go 1.13 or greater.

```console
chmod +x setup-kind.sh
./setup-kind.sh
```

To use kind, you will need to [install docker].  
Once you have docker running you can create a cluster with:

```console
kind create cluster
```

To delete your cluster use:

```console
kind delete cluster
```
build a node image and create a cluster with:

```console
kind build node-image
kind create cluster --image kindest/node:latest
```
Multi-node clusters and other advanced features may be configured with a config
file, for more usage see [the docs][user guide] or run `kind [command] --help`
