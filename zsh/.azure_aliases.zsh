# az ad sp create-for-rbac \
#   --name github-actions \
#   --role Contributor \
#   --scopes /subscriptions/$(az account show --query id --output tsv) \
#   --years 9 \
#   --json-auth

# az aks list --query "[].{rg:resourceGroup,name:name}" -o table
