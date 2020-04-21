#!/bin/sh

tar xvf terraform-output/terraform.tgz -C platform-automation/terraform
cp platform-output/pcf.plan platform-automation/terraform

cd platform-automation/terraform
    terraform apply -f pcf.plan
cd ../../