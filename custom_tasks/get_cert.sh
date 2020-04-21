#!/bin/sh

apk update
apk add jq

echo $TLS | jq -r .\"ca.crt\" > tls-certificate/ca.crt
echo $TLS | jq -r .\"tls.crt\" > tls-certificate/tls.crt
echo $TLS | jq -r .\"tls.key\" > tls-certificate/tls.key