/**
Project Services
@author Siddharth Mishra ** $id i$ di$ **
**/

resource "time_sleep" "wait_10_seconds" {
  depends_on = [
    google_project_service.project_services
  ]
  create_duration = "10s"
}

resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.app_location
  database_type = var.datastore_type
  depends_on = [
    time_sleep.wait_10_seconds
  ]
}

resource "google_project_service" "project_management_services" {
  count   =  length(var.project_management_services)   
  service =  element(var.project_management_services, count.index)  
  project = var.project_id
  depends_on = [
    google_project_iam_member.terraform_service_account
  ]
}

resource "google_project_service" "project_services" {
  count   =  length(var.project_services)   
  service =  element(var.project_services, count.index)  
  project = var.project_id
  depends_on = [
    google_project_service.project_management_services
  ]
}
