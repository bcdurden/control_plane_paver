#!/bin/sh

cd platform-automation/terraform
    terraform init
    terraform plan -out=pcf.plan
    tar czvf ../../terraform-output/terraform.tgz .terraform/
    cp pcf.plan ../../terraform-output
cd ../../