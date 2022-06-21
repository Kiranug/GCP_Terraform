# Iam-and-Services-Step-1 module
A Terraform module that helps create Service Accounts and Manage IAM Permissions.

## Usage

- First go to this Jenkins URL
https://jenkins-lz.globalpay.com/job/lz-eaei/job/project-infrastructure/job/master/
- Click on build with Parameter
- Fill the parameter <br>
PROJECT_ID -- (Required) The target landing zone project ID.
TERRAFORM_GIT_REPO -- (Required) The Terraform git repository URL to be used in execution
TERRAFORM_GIT_REF -- The git ref (branch, tag, commit) to be executed.
TERRAFORM_MODULE_PATH -- (Optional) The path to the target module in this repo. If null, will execute at the repo root.
TERRAFORM_VAR_FILE -- Path to a Terraform variables file
TERRAFORM_STATE_PREFIX -- If multiple Terraform codebases define this project, each should use a unique state prefix.

- Then click on build button to start pipeline
- Terraform Init and Plan will run first. Then it ask for approval. After that it get executed.



## To create

The following Service Account and Keys to be created:
- IAP Service Account
- Application Service Account
- Core Service Account
- Jenkins Service Account
- Pub-Sub service account
- LZ TF account permissions

The following User Roles to be created:
- QA IAM Roles
- Dev Access
- DevOps Access

Service accounts to be stored in Secret Manager:
- application_service_account as gke-app-sa
- core_service_account as gke-core-sa
- gke_tool_server_iap_service_account_key as iap-sa
- jenkins_service_account_key as jenkins-sa

To Allow API service for a project_management_services and project_services


## Inputs

Project:

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project_id | The project ID to host the cluster in | string | - | yes|
| region | Default GCP Region | string | - | yes |
| app_location | Default app location | string | - | yes|
| datastore_type | Default datastore type | string | - | yes|
| business_project_name | Project for which cluster being created | string | - | yes|
| environment | Project environment | string | - | yes|
| gke_tool_server_sa_name | Service account name for gke tool server | string | - | yes|
| application_sa_name | Service account name for application | string | - | yes|
| core_sa_name | Service account name for core apis | string | - | yes|
| jenkins_sa_name | Service account name for jenkins | string | - | yes|



IAM:
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gke_tool_server_iap_service_account_roles | The project ID to host the cluster in | string | - | yes|
| application_service_account_roles | Application Roles | string | - | yes |
| core_service_account_roles | Core Service Roles | string | - | yes |
| jenkins_service_account_roles | Jenkins Service Account Roles | string | - | yes |
| terraform_service_account_roles | TF acc roles | string | - | yes |
| terraform_service_account_email | TF Service account email | string | - | yes |
| dev_user_roles | Dev Service account email | string | - | yes |
| devops_user_roles | Devops Service account email | string | - | yes |
| dev_user_email | Dev group email | string | - | yes |
| devops_user_email | DevOps group email | string | - | yes |

API to Enable:
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project_services | Project Related Service | string | - | yes |
| project_management_services | Project management related service | string | - | yes |



## Outputs

No Output for this Module


## Docs:

module reference docs: 
- terraform.io [GCP Docs](https://registry.terraform.io/providers/hashicorp/google/4.10.0)
- GCP [Service Accounts](https://cloud.google.com/iam/docs/understanding-service-accounts)
- GCP [IAM](https://cloud.google.com/iam/)
