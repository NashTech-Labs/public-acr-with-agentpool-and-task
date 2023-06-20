# public-acr-with-agentpool-and-task
This terraform script will help to create a public azure container registry with Agent pool and also with a task for the registry

## Steps for Execution

- clone the repository
- cd public-acr-with-agentpool-and-task
- create a terraform.tfvars file with the inputs for the variables
- run the following commands
  - terraform init
  - terraform fmt
  - terraform validate
  - terraform plan
  - terraform apply

## Inputs:

| variable | description | type | required | default |
|--|--|--|--|--|
| acr_agent_pool_name | name of the agent pool in the acr | string | false | "acr-agent-pool" |
| acr_task | name of the task in the acr | string | false | "acr-task" |
| context_access_token | PAT token for github to access the context (required in both public or private repo) | string | true | |
| context_path | url of the github repo where dockerfile and other context are stored | string | true | |

## Outputs:

| variable | description | type |
|--|--|--|
| acr_name | name of the acr created | string |
| acr_id | id of the acr created | string |