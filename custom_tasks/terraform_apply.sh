#!/bin/sh

tar xvf terraform-output/terraform.tgz -C platform-automation/terraform

cd platform-automation/terraform
    terraform apply -f pcf.plan
    rm terraform-output/terraform.tgz
    tar czvf ../../terraform-output/terraform.tgz .terraform/ pcf.plan terraform.tfstate
cd ../../