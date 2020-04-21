#!/bin/sh

pushd platform-automation/terraform
    terraform init
    tar czvf terraform.tgz .terraform/
popd

mv terraform.tgz ../../terraform-output