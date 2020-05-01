#!/bin/sh

# PARAMS: TLS

export TLS_CA=$(cat tls-certificate/ca.crt)
export TLS_KEY=$(cat tls-certificate/tls.key)
export TLS_CERT=$(cat tls-certificate/tls.crt)
cd paver-automation/terraform
    terraform init
    terraform plan -out=pcf.plan -var="tls_ca_certificate=$TLS_CA" -var="tls_private_key=$TLS_KEY" -var="tls_wildcard_certificate=$TLS_CERT"
    terraform apply pcf.plan

    cp pcf.plan ../../terraform-output
    cp terraform.tfstate ../../terraform-output
cd ../../