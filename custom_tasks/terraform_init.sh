#!/bin/sh

# PARAMS: TLS_CA
echo $TLS_CA
cd platform-automation/terraform
    terraform init
    terraform plan -out=pcf.plan -var="tls_ca_certificate=$TLS_CA"
    tar czvf ../../terraform-output/terraform.tgz .terraform/
    cp pcf.plan ../../terraform-output
cd ../../