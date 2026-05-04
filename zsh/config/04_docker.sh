#!/bin/bash

docker-shell() {
  docker run --rm -i -t -v $(pwd):/data/src -w /data/src --entrypoint /bin/sh "$@"
}

docker-cleanup() {
  containers="$(docker ps -q -a)"

  if [ -z $containers ]; then
    echo "No containers to cleanup" && return 1
  fi

  xargs docker rm <<<"$containers"
}

docker-info() {
  containers="$(docker ps -q)"

  if [ -z $containers ]; then
    echo "No containers running" && return 1
  fi

  xargs docker inspect \
    --format='{{.Config.Image}}, {{.NetworkSettings.IPAddress}}, {{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' \
    <<<"$containers"
}
