#!/usr/bin/env python

from __future__ import print_function
import boto3
import time
import logging

logging.basicConfig()
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def main():
    while True:
        logger.info("EXAMPLE HAS BEEN STARTED")
        time.sleep(30)

if __name__ == '__main__':
    main()
