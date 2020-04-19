#!/bin/bash
set -eu
# script to install go
go_version=${go_version:-1.14.2}
url="https://dl.google.com/go/go${go_version}.linux-amd64.tar.gz"
installed_dir="/usr/local"
echo 'Installing go...'
wget ${url}
sudo tar zxf go${go_version}.linux-amd64.tar.gz -C ${installed_dir}
export PATH=${installed_dir}/go/bin:$PATH
echo "go version is : $(go version)"
GO111MODULE="on" go get sigs.k8s.io/kind@v0.7.0
export PATH=$(pwd)/go/bin:$PATH
echo "kind version is : $(kind version)"
echo "Install Kubectl..."
kubectl_version=v1.18.0
curl -LO https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo "kind version is : $(kubectl version --client)"

