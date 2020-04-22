#!/bin/sh

tar xvf terraform-output/terraform.tgz -C platform-automation/terraform

cd platform-automation/terraform
    terraform apply pcf.plan
    if [ $? == 0 ]; then
        rm ../../terraform-output/terraform.tgz
        tar czvf ../../terraform-output/terraform.tgz .terraform/ pcf.plan terraform.tfstate
    fi
cd ../../