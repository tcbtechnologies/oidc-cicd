data "google_project" "project" {}

rsource "google_iam_workload_identity_pool" "pool" {
  project                   = data.google_project.project.project_id
  workload_identity_pool_id = "deployment"
  display_name              = "CI/Deployment Tools"
  lifecycle {
    ignore_changes = [project]
  }
}

resource "google_iam_workload_identity_pool_provider" "github" {
  project                            = data.google_project.project.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions"
  display_name                       = "Github Actions"
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
  lifecycle {
    ignore_changes = [project]
  }
}

output "identity_pool" {
  value = google_iam_workload_identity_pool.pool.name
}

