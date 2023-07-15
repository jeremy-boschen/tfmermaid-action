#!/usr/bin/env bash

set -euo pipefail

temp=$(mktemp $1.XXXXXXXXXX)

graph_args=
if [[ -n "${3-}" ]]; then
  graph_args="-plan=$3"
fi

terraform graph $graph_args | node $(dirname $0)/index.mjs $1 $2 > $temp

mv $temp $1
