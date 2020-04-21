#!/bin/sh

# PARAMS: TLS_CA

export TLS_CA=$(cat tls-certificate/ca.crt)
export TLS_KEY=$(cat tls-certificate/tls.key)
export TLS_CERT=$(cat tls-certificate/tls.crt)
cd platform-automation/terraform
    terraform init
    terraform plan -out=pcf.plan -var="tls_ca_certificate=$TLS_CA" -var="tls_private_key=$TLS_KEY" -var="tls_wildcard_certificate=$TLS_CERT"
    tar czvf ../../terraform-output/terraform.tgz .terraform/
    cp pcf.plan ../../terraform-output
cd ../../