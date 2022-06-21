/**
Varaibles values
@author Kiran Ugavekar** $id i$ di$ **
**/

/**
Project
**/
business_project_name   = "kims"
environment             = "dev"
project_id              = "gkedemo-350708"
gke_tool_server_sa_name = "kims-iap-tunnel-user"
application_sa_name     = "kims-ei-application"

/**
IAM
**/
terraform_service_account_email = "gkedemo-terraform@gkedemo-350708.iam.gserviceaccount.com"

qa_user_roles = []
dev_user_roles = [ 
    "roles/viewer",
    "roles/spanner.databaseUser",
    "roles/bigquery.user",
    "roles/pubsub.publisher",
    "roles/pubsub.subscriber",
    "roles/dataflow.developer",
    "roles/storage.admin",
    "roles/serviceusage.serviceUsageConsumer"
 ]
 
devops_user_roles = [
    "roles/viewer",
    "roles/iap.tunnelResourceAccessor",
    "roles/secretmanager.admin",
    "roles/compute.instanceAdmin.v1",
    "roles/iam.serviceAccountUser",
    "roles/logging.admin",
    "roles/datastore.owner",
    "roles/bigquery.admin",
    "roles/editor"
]
#support_user_roles = [
#    "roles/viewer"
#]

qa_user_email = ""
dev_user_email = "kiran.ug123@gmail.com"
devops_user_email = "kiran.ug123@gmail.com"
