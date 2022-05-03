#!/bin/bash

runJenkinsContainer() {
  jenkinsContainerRunning=$(docker ps | grep jenkins)
  if [[ $jenkinsContainerRunning ]]; then
    echo "[INFO] Stopping jenkins container" &&
      docker container stop jenkins
  fi

  nodeContainer=$(docker container ls --all | grep jenkins)
  if [[ $nodeContainer ]]; then
    docker container rm jenkins
  fi

  echo "[INFO] Building new jenkins container" &&
    docker build -f Dockerfile -t jenkins . || exit

  echo "[INFO] Running jenkins container" &&
    docker run --name=jenkins \
      -p 8080:8080 -p 50000:50000 \
      -v /var/jenkins_home:/var/jenkins_home \
      -v /var/run/docker.sock:/var/run/docker.sock \
      --restart unless-stopped \
      -d jenkins || exit
}

runJenkinsContainer
