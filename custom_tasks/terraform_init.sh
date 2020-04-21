#!/bin/sh

cd platform-automation/terraform
    terraform init
    tar czvf ../../terraform-output/terraform.tgz .terraform/
cd ../../