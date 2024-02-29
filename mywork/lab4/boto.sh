#!/bin/bash

# import boto3

# create client
# s3=boto3.client('s3', region_name="us-east-1")

# make request
# response = s3.list_buckets()

bucket='ds2002-tnb6zdz'
# os.environ["LOCAL_FILE"] = input('What file do you want to upload? ')

# local_file = os.getenv("LOCAL_FILE")

# local_file = input('What file do you want to upload? ')

read -p "What file do you want to upload? " local_file

aws s3 cp --acl public-read $local_file s3://$bucket/

# resp=s3.put_object(
#     Body = local_file,
#     Bucket = bucket,
#     Key = local_file,
#     ACL = 'public-read'
# )

# curl URL > file
# aws s3 cp FILE s3://ds2002-tnb6zdz/
# aws s3 ls s3://ds2002-tnb6zdz/


# url: https://s3.amazonaws.com/ds2002-tnb6zdz/(file)
