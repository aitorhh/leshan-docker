#!/bin/sh
# Start leshan demo server
cd /opt/leshan-bsserver-demo/
chpst -u leshan java -jar ./leshan-bsserver-demo.jar --coapport 5783 --coapsport 5784 --webport 8081
