
BRANCH=$(git branch | awk 'FNR == 1 {print $2}')

#################################################################

###  Terraform configuration.
###  Creates or selects workspaces based off of the branch name
###  Also runs terraform plan and terraform apply
#################################################################


terraform init -backend=true


python3 << EOF
import subprocess, os
workspaces = subprocess.getoutput("terraform workspace list")
print(workspaces)
if '$BRANCH' not in workspaces:
    os.system("terraform workspace new $BRANCH")
elif '$BRANCH' in workspaces:
    os.system("terraform workspace select $BRANCH")
EOF


#terraform import kubernetes_service.eos-externa

terraform plan \
        -var="target_namespace=$BRANCH" \

terraform apply \
        -var="target_namespace=$BRANCH" \
        -auto-approve

