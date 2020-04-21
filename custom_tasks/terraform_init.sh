#!/bin/sh

# PARAMS: TLS_CA

cd platform-automation/terraform
    terraform init
    terraform plan -out=pcf.plan -var="tls_ca_certificate=$TLS_CA" -var="tls_private_key=$TLS_KEY" -var="tls_wildcard_certificate=$TLS_CERT"
    tar czvf ../../terraform-output/terraform.tgz .terraform/
    cp pcf.plan ../../terraform-output
cd ../../