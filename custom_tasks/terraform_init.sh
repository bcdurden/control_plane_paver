#!/bin/bash

cd ../platform-automation/terraform
terraform init
tar czvf terraform.tgz .terraform/
mv terraform.tgz ../../terraform-output