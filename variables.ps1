az config set extension.use_dynamic_install=yes_without_prompt
$env:orgurl = SetdefaultAzuredevops -org "adamhumphreyext" -Project "PSM" 
$env:srepo = "multicloud"
$env:github = "humphrey2019"
$env:ymlpaths = ".\pipelines\"
$env:kv = 'vaultajhtest001' #name of organization that hosts your projects
$env:org = "adamhumphreyext" # Name of new Project
$env:Project = "PSM" # location of all your yml files
$env:reponame = 'newrepo' # name of your github account
$env:users = './settings/users.csv'
$env:polcsv = './settings/Policysettings.csv' # Policy csv - Base file for policies possibly can be cleaned up to remove users since reference elsewhere
$env:scpath = './settings/serviceconnections.json' # subscription info
$env:vgcsv = './settings/vargrp.csv' #location of csv file for base variable group
$env:workitems = './workitems/testing.csv'
$env:certname = "devtest-adamh"
$ENV:ARM_CLIENT_ID = az ad app list --query "[?displayName=='$env:certname'].appId" -o tsv
$ENV:ARM_SUBSCRIPTION_ID = "f12b424b-0f22-4bcb-9dbb-ed1269ff8cea"
$ENV:ARM_TENANT_ID       = "b24ae986-0d3d-4059-9392-00717ec8001c"
$ENV:ARM_CLIENT_SECRET   = (az keyvault secret show --query "value" --name ($env:certname + "secret") --vault-name $env:kv -o tsv) # # GIT token
$env:manifest = join-path $env:HOMEPATH "\Documents\PowerShell\Modules\Devop\1.1.6\Templates\manifest.json"
$env:sbname = "testing-env-dev01"
$env:AZURE_DEVOPS_EXT_PAT = (kv.secret -name 'PAT' -KeyVaultName $env:kv -show) # PAT Token to be used to interact with Azure Devops 
$env:AZURE_DEVOPS_EXT_GIT_SOURCE_PASSWORD_OR_PAT =  (az keyvault secret show --query "value" --name 'GITTOKEN' --vault-name $env:kv -o tsv) # # GIT token
$env:AZURE_DEVOPS_EXT_GITHUB_PAT = $env:AZURE_DEVOPS_EXT_GIT_SOURCE_PASSWORD_OR_PAT
echo $env:AZURE_DEVOPS_EXT_GIT_SOURCE_PASSWORD_OR_PAT | gh auth login --with-token
#need to determine which of these actually is needed
