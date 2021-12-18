#!/bin/bash

#1. Create an SPOT instance
#2. Take that Instance IP & register in DNS

TEMP_ID="lt-00c437664b04d92df"
TEMP_VER=2

## Check if instance is already ther e

aws ec2 describe-instances --filters "Name=tag:Name,Values=frontend" | jq .Reservations[].Instances[].State.Name | sed 's/"//g' | grep -E 'running|stopped' &>/dev/null
if [ $? -eq -0 ]; then
  echo "Instance is already there"
  exit
fi



aws ec2 run-instances --launch-template LaunchTemplateId=${TEMP_ID},Version=${TEMP_VER} --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=frontend}]" "ResourceType=instance,Tags=[{Key=Name,Value=frontend}]" | jq

# Update the DNS record
