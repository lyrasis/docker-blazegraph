#!/bin/bash

VARS="${PWD}/vars/*"

for v in $VARS
do
  FILENAME=${v##*/}
  VERSION=${FILENAME%.*}
  ansible-playbook -i 'localhost,' build.yml --extra-vars="config_file=$v output_directory=$VERSION"
done
