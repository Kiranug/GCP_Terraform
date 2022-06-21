/**
IAM Roles
@author Siddharth Mishra ** $id i$ di$ **
**/

/**
Service Account and Keys 
**/

#IAP Service Account
resource "google_service_account" "gke_tool_server_iap_service_account" {
  account_id   = var.gke_tool_server_sa_name
  display_name = "GKE Tool Server IAP Tunnel User"
}

resource "google_service_account_key" "gke_tool_server_iap_service_account_key" {
  service_account_id = google_service_account.gke_tool_server_iap_service_account.name
}

#Application Service Account
resource "google_service_account" "application_service_account" {
  account_id   = var.application_sa_name
  display_name = "Application Service Account"
}


resource "google_service_account_key" "application_service_account_key" {
  service_account_id = google_service_account.application_service_account.name
}

#core Service Account
resource "google_service_account" "core_service_account" {
  account_id   = var.core_sa_name
  display_name = "Core Service Account"
}


resource "google_service_account_key" "core_service_account_key" {
  service_account_id = google_service_account.core_service_account.name
}

#Jenkins Service Account
resource "google_service_account" "jenkins_service_account" {
  account_id   = var.jenkins_sa_name
  display_name = "Jenkins Service account"
}

resource "google_service_account_key" "jenkins_service_account_key" {
  service_account_id = google_service_account.jenkins_service_account.name
}


/**
Service Account Roles
**/

#IAP IAM Roles
resource "google_project_iam_member" "gke_tool_server_iap_service_account" {
  project  = var.project_id
  count   =  length(var.gke_tool_server_iap_service_account_roles)   
  role    =  element(var.gke_tool_server_iap_service_account_roles, count.index)
  member  = "serviceAccount:${google_service_account.gke_tool_server_iap_service_account.email}"
}

#Application Service Account
resource "google_project_iam_member" "application_service_account" {
  project  = var.project_id
  count   =  length(var.application_service_account_roles)   
  role    =  element(var.application_service_account_roles, count.index)
  member  = "serviceAccount:${google_service_account.application_service_account.email}"
}

#Core Service Account
resource "google_project_iam_member" "core_service_account" {
  project  = var.project_id
  count   =  length(var.core_service_account_roles)   
  role    =  element(var.core_service_account_roles, count.index)
  member  = "serviceAccount:${google_service_account.core_service_account.email}"
}

#Jenkins IAM Roles
resource "google_project_iam_member" "jenkins_service_account" {
  project  = var.project_id
  count   =  length(var.jenkins_service_account_roles)   
  role    =  element(var.jenkins_service_account_roles, count.index)
  member  = "serviceAccount:${google_service_account.jenkins_service_account.email}"
}

#Pub-Sub service account
resource "google_project_iam_member" "pub_sub_account" {
  project  = var.project_id
  count   =  length(var.pub_sub_account_roles)   
  role    =  element(var.pub_sub_account_roles, count.index)
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}

#LZ TF account permissions
resource "google_project_iam_member" "terraform_service_account" {
  project  = var.project_id
  count   =  length(var.terraform_service_account_roles)   
  role    =  element(var.terraform_service_account_roles, count.index)
  member  = "serviceAccount:${var.terraform_service_account_email}"
}

/**
User Roles
**/
#QA IAM Roles
/**
resource "google_project_iam_member" "qa_user" {
  count   =  length(var.qa_user_roles)   
  role    =  element(var.qa_user_roles, count.index)
  member  =  "group:${var.qa_user_email}"
}
**/

#Dev Access
 resource "google_project_iam_member" "dev_user" {
  project  = var.project_id
  count   =  length(var.dev_user_roles)   
  role    =  element(var.dev_user_roles, count.index)
  member  =   "group:${var.dev_user_email}"
}

#DevOps Access
 resource "google_project_iam_member" "devops_user" {
  project  = var.project_id
  count   =  length(var.devops_user_roles)   
  role    =  element(var.devops_user_roles, count.index)
  member  =   "group:${var.devops_user_email}"
}

#Support Access
 #resource "google_project_iam_member" "support_user" {
 # count   =  length(var.support_user_roles)   
 # role    =  element(var.support_user_roles, count.index)
 # member =   "group:${var.support_user_email}"
#}
