#!/bin/sh
KGCR="k8s.gcr.io/"
mkdir -p "release"
cat k8s.gcr.io | while read line
do
  echo "build ${line} ......................."
  docker pull ${KGCR}${line}
  docker save ${KGCR}${line} | gzip -c > release/${line}.tar
done
ls -l release/
