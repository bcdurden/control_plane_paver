#!/bin/sh

cd platform-automation/terraform
    terraform init
    tar czvf terraform.tgz .terraform/
cd ../../

mv terraform.tgz ../../terraform-output