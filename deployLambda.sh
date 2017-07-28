#!/bin/bash
aws_access_key_id_string=`cat $HOME/.aws/credentials | grep aws_access_key_id`
aws_secret_access_key_string=`cat $HOME/.aws/credentials | grep aws_secret_access_key`

# Getting credentials from .aws
IFS=' = ' read -ra KEYID <<< "$aws_access_key_id_string"

IFS=' = ' read -ra AKEY <<< "$aws_secret_access_key_string"

docker build -t server-less-deploy -f Dockerfile.requeriments .
docker run -e "AWS_SECRET_ACCESS_KEY=${AKEY[1]}" -e "AWS_ACCESS_KEY_ID=${KEYID[1]}" -ti server-less-deploy