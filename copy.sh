#!/bin/bash

folders=$(ls -d */)
for folder in $folders
do
  echo "copying Dockerfile to $folder"
  cp Dockerfile $folder
  echo "copying entry_point.sh to $folder"
  cp entry_point.sh $folder
  echo "--------------------------------"
done