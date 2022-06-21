/**
Terraform providers and Backend SetupS
@author Siddharth Mishra ** $id i$ di$ **
**/

provider "google" {
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  project  = var.project_id  
  region   = var.region
}

data "google_project" "project" {
  project_id = var.project_id
}
