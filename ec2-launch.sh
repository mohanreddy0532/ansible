#!/bin/bash

#1. Create an SPOT instance
#2. Take that Instance IP & register in DNS

aws ec2 request-spot-instances --instance-count 1 --type "persistent" --launch-specification file://spot.json --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=frontend}]"
