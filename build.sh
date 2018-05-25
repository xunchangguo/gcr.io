#!/bin/sh
DEP_ROOT=$(git rev-parse --show-toplevel)
mkdir -p "${DEP_ROOT}/release"
GCR="gcr.io/google_containers/"
cat gcr.io | while read line
do
  echo "build ${line} ......................."
  docker pull ${GCR}${line}
  docker save ${GCR}${line} | gzip -c > release/${line}.tar
done
