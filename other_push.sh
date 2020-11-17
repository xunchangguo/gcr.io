#!/bin/sh
cat other | while read line
do
  echo "pull ${line} ......................."
  docker pull ${line}
done
echo "$SECRET_TKEY" | docker login -u xunchangguo --password-stdin docker.pkg.github.com
cat other | while read line
do
  echo "push ${line} ......................."
  docker tag ${line} docker.pkg.github.com/xunchangguo/${line}
  docker push docker.pkg.github.com/xunchangguo/repository-name/${line}
done
