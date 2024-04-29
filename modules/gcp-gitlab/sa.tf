resource "google_service_account" "deployment" {
  account_id   = "gitlab-ci-deployments"
  display_name = "CI Deployments"
}

resource "google_service_account_iam_binding" "deployment" {
  service_account_id = google_service_account.deployment.name
  role               = "roles/iam.workloadIdentityUser"

  # See step 8 of https://gitlab.com/google-gitlab-actions/auth#setup
  members = [
    for repo in local.repos :
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/attribute.repository/${repo}"
  ]
}

output "service_account" {
  value = google_service_account.deployment.email
}
