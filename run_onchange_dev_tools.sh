#!/bin/bash

yay_install() { 
 yay -Sy --needed --noconfirm --cleanafter "$@"
}

sudo pacman -S --needed --noconfirm \
  docker docker-buildx tanka kubectl argocd jq yq vault \
  pre-commit helm aws-cli-v2 terragrunt terraform

yay_install \
  kind slack-desktop zoom google-cloud-cli \
  google-cloud-cli-gke-gcloud-auth-plugin jsonnet-go \
  jsonnet-bundler jsonnet-language-server jsonnetfmt snyk \
  kubebuilder-bin mongosh-bin

# Download the binary
curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v3.5.5/argo-linux-amd64.gz &&
  gunzip argo-linux-amd64.gz && 
  chmod +x argo-linux-amd64 && 
  mv ./argo-linux-amd64 $HOME/.local/bin/argo

sudo usermod --append --groups docker john

sudo systemctl enable --now docker
sudo systemctl enable --now containerd
