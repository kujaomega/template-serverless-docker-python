from __future__ import print_function
import time
import requests
import json
import boto3
from botocore.exceptions import ClientError

s3_client = boto3.client('s3')
glacier_client = boto3.client('glacier')


def lambda_handler(event, context):
    start = time.time()
    
    done = time.time()
    elapsed = done - start
    print('Time for query: %s for query: %s' % (elapsed, event['body']))
    response = {
        'statusCode': 200,
        'headers': {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Credentials": True
        },
        'body': json.dumps({'test': 'test'})
    }

    return response
