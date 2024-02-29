#!/bin/bash

read -p "Please give me a link to a file: " FILE

name=$(basename "$FILE")

curl $FILE > $name

aws s3 cp $name s3://ds2002-tnb6zdz/

aws s3 ls s3://ds2002-tnb6zdz/

aws s3 presign --expires-in 604800 s3://ds2002-tnb6zdz/$name

# url: https://ds2002-tnb6zdz.s3.us-east-1.amazonaws.com/2021.03.10_AnimalCuteness_Getty.width-1000.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAU6GDYNYXT3VT3MED%2F20240229%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240229T143312Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Security-Token=FwoGZXIvYXdzEC8aDGU%2BcGUF%2F0r0e13FkCLFAQ79RLAENnEKBz%2BZWKGz2a2dtKpsI7IWRSxDxc52iFoT2Q%2Fy0zD55m%2FLNyhZH8ugTnWIfTDOicsEycd65LV2YBw8y45M5muqOCZdBIsC73ncikAAdmnBjMxIn887reRuwxPhFJmO0Sd9cnXI8OstNAGNKetQtkfkHqq6EsKURExUky92wuu%2Fb0oCBdS%2BZGtC4oRciUtKzRjIZuF6fE%2BZa7gt8yzso0jSYcmPaGHy8v6JYp%2FtPMcOHlbwmdRiP9XMQg%2Bf3FBbKJaCgq8GMi0lkOo81naGqq53gaN%2BDAll%2FWyqtRy33NzR7zKuslORvUMjpWms2DdJwdy79iY%3D&X-Amz-Signature=d4fb6b38652394309e67355e9574de56725354c52fbc140c11676537daf656f9