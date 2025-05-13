#!/bin/sh

repo_exists() {
  test -d "${REPO_NAME}"
}

cd_repo() {
  cd "${REPO_NAME}"
}
                                                                 
update_repo() {
  cd_repo &&
  echo "Updating repo..." &&
  git pull
}

clone_repo() {
  echo "Cloning repo..." &&
  git clone "https://github.com/${REPO}.git" &&
  cd_repo
}

(repo_exists && update_repo) || clone_repo
                                                                 
echo "Tearing down containers..."
podman kube down ./kube.yml

echo "Removing current glint image..."
podman image rm glint

echo "Pulling latest glint image..."
podman image pull ghcr.io/vectorsquad/glint:latest

echo "Playing containers..."
podman kube play ./kube.yml 