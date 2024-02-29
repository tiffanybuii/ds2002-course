#!/Library/Frameworks/Python.framework/Versions/3.9/bin/python3

import requests
from boto3.s3.transfer import S3Transfer
import boto3

s3 = boto3.client('s3', region_name='us-east-1')
bucket = 'ds2002-tnb6zdz'

url = input('What is a url to a file you want to upload? ')
name = url.split('/')[-1]

r = requests.get(url)
with open(name, 'wb') as f:
    f.write(r.content)

transfer = S3Transfer(s3)
transfer.upload_file(name, bucket, name)

expires_in = 604800

type = name.split('.')[-1]
full_type = 'image/' + type

response = s3.generate_presigned_url(
    'get_object',
    Params={'Bucket': bucket, 'Key': name, 'ResponseContentType': full_type},
    ExpiresIn=expires_in
    )

print(response)

# presigned url: https://ds2002-tnb6zdz.s3.amazonaws.com/7d5d665f92c09858439458678bc879a4.gif?response-content-type=image%2Fgif&AWSAccessKeyId=ASIAU6GDYNYXT3VT3MED&Signature=y9of7WZ%2BIM0q%2BvqAFQDiZzKHmFA%3D&x-amz-security-token=FwoGZXIvYXdzEC8aDGU%2BcGUF%2F0r0e13FkCLFAQ79RLAENnEKBz%2BZWKGz2a2dtKpsI7IWRSxDxc52iFoT2Q%2Fy0zD55m%2FLNyhZH8ugTnWIfTDOicsEycd65LV2YBw8y45M5muqOCZdBIsC73ncikAAdmnBjMxIn887reRuwxPhFJmO0Sd9cnXI8OstNAGNKetQtkfkHqq6EsKURExUky92wuu%2Fb0oCBdS%2BZGtC4oRciUtKzRjIZuF6fE%2BZa7gt8yzso0jSYcmPaGHy8v6JYp%2FtPMcOHlbwmdRiP9XMQg%2Bf3FBbKJaCgq8GMi0lkOo81naGqq53gaN%2BDAll%2FWyqtRy33NzR7zKuslORvUMjpWms2DdJwdy79iY%3D&Expires=1709820960

# not sure if i should make public as well?

# priv_publ = input('Would you like the file public? Choose yes or no. ')
# if (priv_publ == 'yes'):
#     resp = s3.put_object(
#         Body = name,
#         Bucket = bucket,
#         Key = name,
#         ACL = 'public-read'
#     )
    
#     print('done! public link: https://s3.amazonaws.com/ds2002-tnb6zdz/' + name)