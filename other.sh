#!/bin/sh
cat other | while read line
do
  echo "build ${line} ......................."
  docker pull ${line}
  docker save ${line} | gzip -c > release/${line##*/}.tar
done