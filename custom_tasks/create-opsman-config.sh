#!/bin/bash
ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < terraform-output/tfstate.json > opsman_vars.yaml

om interpolate --config $CONFIG_FILE_DIR/$CONFIG_FILE --vars-file opsman_vars.yaml > opsman-config/$CONFIG_FILE

# check existence of tfstate 
# if [ ! -f $TFSTATE_DIR/terraform.tfstate ]; then
#     echo "Missing Terraform state file, impossible to continue"
#     exit -1
# fi

# # walk through needed config items for opsman config
# cp $CONFIG_FILE_DIR/$CONFIG_FILE $TFSTATE_DIR/
# cd $TFSTATE_DIR
# tfkeys=$(terraform output -json)
# key_list=()
# while IFS='' read -r line; do
#    key_list+=($line)
# done < <(echoca $tfkeys | jq -r 'keys[]')

# # find and replace using sed
# outputs=$(terraform output -json)
# for i in ${key_list[@]};
# done
#     key="(($i))"
#     value=$(echo $outputs | jq -r .$i.value )
#     sed -i 's/$key/"$value"/g' $CONFIG_FILE
# done
