#!/bin/bash

app_name="my_test"
image_ver="1.0"
port=8081

# 刪掉原本的container
check_docker_ps=$(docker ps | grep "$app_name" | wc -l)
if [ "$check_docker_ps" = 1 ]; then
    docker rm -f "$app_name"
fi

# 刪掉原本的image
check_docker_images=$(docker images | grep "$app_name" | wc -l)
if [ "$check_docker_images" = 1 ]; then
    docker rmi "$app_name:$image_ver"
fi

# 製作新的image
docker build -t "$app_name:$image_ver" .

# 執行新的container
docker run -d -p "$port:$port" --name "$app_name" "$app_name:$image_ver"

# 刪掉原本的jar
if [ -f ./demo-0.0.1-SNAPSHOT.jar ]; then
    rm -f ./demo-0.0.1-SNAPSHOT.jar
fi