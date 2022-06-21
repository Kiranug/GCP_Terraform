/**
Variables
@author Siddharth Mishra ** $id i$ di$ **
**/

/**
Project
**/
variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "region" {
  description = "Default GCP Region"
}

variable "app_location" {
  description = "Default app location"
}

variable "datastore_type" {
  description = "Default datastore type"
}

variable "business_project_name"{
  description = "Project for which cluster being created"
}

variable "environment" {
  description = "Project environment"
}

variable "gke_tool_server_sa_name" {
  description = "Service account name for gke tool server"
}

variable "application_sa_name" {
  description = "Service account name for application"
}

variable "core_sa_name" {
  description = "Service account name for core apis"
}

variable "jenkins_sa_name" {
  description = "Service account name for jenkins"
}

/**
IAM
**/
#Service Accounts
variable "gke_tool_server_iap_service_account_roles" {
  type = list(string)
}

variable "application_service_account_roles" {
  type = list(string)
}

variable "core_service_account_roles" {
  type = list(string)
}

variable "jenkins_service_account_roles" {
  type = list(string)
}

variable "pub_sub_account_roles" {
  type = list(string)
}

variable "terraform_service_account_roles" {
  type = list(string)
}

variable "terraform_service_account_email"{
  description = "TF Service account email"
}

variable "dev_user_roles" {
  type = list(string)
}

variable "devops_user_roles" {
  type = list(string)
}


variable "dev_user_email"{
  description = "Dev group email"
}

variable "devops_user_email"{
  description = "DevOps group email"
}

#variable "support_user_email"{
#  description = "Support group email"
#}

/**
Services
**/
variable "project_services" {
  type = list(string)
}

variable "project_management_services" {
  type = list(string)
}

