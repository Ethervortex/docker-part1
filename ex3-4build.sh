#!/bin/sh

github_repo=$1
docker_repo=$2
git clone "https://github.com/$github_repo.git"
cd "$(basename "$github_repo" .git)"
docker build -t "$docker_repo" .
if [[ -n "$DOCKER_USER" && -n "$DOCKER_PWD" ]]; then
    echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
fi
docker push "$docker_repo"
