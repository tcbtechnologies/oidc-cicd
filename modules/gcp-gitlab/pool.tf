data "google_project" "project" {}

resource "google_iam_workload_identity_pool" "pool" {
  project                   = data.google_project.project.project_id
  workload_identity_pool_id = "gitlab"
  display_name              = "Gitlab CI"
  lifecycle {
    ignore_changes = [project]
  }
}

resource "google_iam_workload_identity_pool_provider" "gitlab" {
  project                            = data.google_project.project.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "gitlab"
  display_name                       = "Gitlab CI"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://gitlab.com"
  }
  lifecycle {
    ignore_changes = [project]
  }
}

output "audience" {
  value = "//iam.googleapis.com/${google_iam_workload_identity_pool_provider.gitlab.id}"
}

