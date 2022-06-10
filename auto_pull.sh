#!/bin/bash

REMOTE_SHA=$(git rev-parse origin/main)
LOCAL_SHA=$(git rev-parse HEAD)

echo "$REMOTE_SHA"
echo "$LOCAL_SHA"



pull_images () {
while read -u 10 p; do
  docker pull $p
done 10<image_list.txt
}

if [[ "$REMOTE_SHA" == "$LOCAL_SHA" ]]
then
    echo "same"

else
    echo "not same"
    pull_images
    git pull origin main
fi
    
