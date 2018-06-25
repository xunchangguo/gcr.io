#!/bin/sh
KGCR="quay.io/coreos/"
cat quay.io | while read line
do
  echo "build ${line} ......................."
  docker pull ${KGCR}${line}
  docker save ${KGCR}${line} | gzip -c > release/${line}.tar
done