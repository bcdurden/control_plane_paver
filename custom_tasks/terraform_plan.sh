#!/bin/sh

tar xvf terraform-output/terraform.tgz -C platform-automation/terraform
cd platform-automation/terraform
    terraform plan -out=pcf.plan
    cp pcf.plan ../../terraform-output
cd ../../