#!/bin/sh
basepath=$(pwd)

cat k8s.rpm | while read line
do
  echo "build ${line} ......................."
  docker run --rm -v $basepath/kubernetes.repo:/etc/yum.repos.d/kubernetes.repo -v $basepath/release:/k8s  docker.io/centos:7 yum install --downloadonly --downloaddir=/k8s ${line}
done
