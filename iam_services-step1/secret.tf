/**
Secrets
@author Siddharth Mishra ** $id i$ di$ **
**/

resource "google_secret_manager_secret" "application_service_account" {
  secret_id = "gke-app-sa"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "application_service_account" {
  secret = google_secret_manager_secret.application_service_account.id
  secret_data = base64decode(google_service_account_key.application_service_account_key.private_key)
}

resource "google_secret_manager_secret" "core_service_account" {
  secret_id = "gke-core-sa"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "core_service_account" {
  secret = google_secret_manager_secret.core_service_account.id
  secret_data = base64decode(google_service_account_key.core_service_account_key.private_key)
}

resource "google_secret_manager_secret" "gke_tool_server_iap_service_account_key" {
  secret_id = "iap-sa"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "gke_tool_server_iap_service_account_key" {
  secret = google_secret_manager_secret.gke_tool_server_iap_service_account_key.id
  secret_data = base64decode(google_service_account_key.gke_tool_server_iap_service_account_key.private_key)
}

resource "google_secret_manager_secret" "jenkins_service_account_key" {
  secret_id = "jenkins-sa"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "jenkins_service_account_key" {
  secret = google_secret_manager_secret.jenkins_service_account_key.id
  secret_data = base64decode(google_service_account_key.jenkins_service_account_key.private_key)
}
