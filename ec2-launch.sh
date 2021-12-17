#!/bin/bash

#1. Create an SPOT instance
#2. Take that Instance IP & register in DNS

TEMP_ID="lt-00c437664b04d92df"
TEMP_VER=2

aws ec2 run-instances --launch-template LaunchTemplateId=${TEMP_ID},Version=${TEMP_VER} --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=frontend}]" "ResourceType=instance,Tags=[{Key=Name,Value=frontend]" | jq
