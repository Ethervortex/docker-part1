#!/bin/bash

github_repo=$1
docker_repo=$2
git clone "https://github.com/$github_repo.git"
cd "$(basename "$github_repo" .git)"
docker build -t "$docker_repo" .
docker login
docker push "$docker_repo"
