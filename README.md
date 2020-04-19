
# Please see [Our Documentation](https://kind.sigs.k8s.io/docs/user/quick-start/) for more in-depth installation etc.

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

This will put `kind` in `$(go env GOPATH)/bin`. If you encounter the error
`kind: command not found` after installation then you may need to either add that directory to your `$PATH` as
shown [here](https://golang.org/doc/code.html#GOPATH) or do a manual installation by cloning the repo and run 
`make build` from the repository.

Without installing go, kind can be built reproducibly with docker using `make build`.

Stable binaries are also available on the [releases] page. Stable releases are
generally recommended for CI usage in particular.
To install, download the binary for your platform from "Assets" and place this
into your `$PATH`:

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
