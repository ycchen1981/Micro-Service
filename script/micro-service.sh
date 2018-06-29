#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin

project_name=$1
version=$2
port=$3

jar_file_name="$project_name-$version".jar
source_dir=/home/zipe/micro-service/
target_dir=/home/zipe/tmp/
project_dir_path=$target_dir$project_name

file_full_path="$source_dir$jar_file_name"

echo "Jar file : $jar_file_name"
echo "Source directory : $source_dir"

if [ -d "$project_dir_path" ]
then
       echo "Remove $project_dir_path directory files."
       /bin/rm -rf "$project_dir_path"/*
else
       echo "Create $project_dir_path directory."
       /bin/mkdir -p $project_dir_path
fi

if [ -f "$file_full_path" ]
then
        echo "$file_full_path found."
        /bin/cp -Ra "$file_full_path" "$project_dir_path"
else
        echo "$file_full_path not found."
        exit 1
fi

fuser -k "$port"/tcp;java -jar "$project_dir_path/$jar_file_name" >/dev/null  2>&1  &

echo "success"