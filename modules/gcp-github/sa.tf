resource "google_service_account" "deployment" {
  account_id   = "ci-deployments"
  display_name = "CI Deployments"
}

resource "google_service_account_iam_binding" "deployment" {
  service_account_id = google_service_account.deployment.name
  role               = "roles/iam.workloadIdentityUser"

  # See step 8 of https://github.com/google-github-actions/auth#setup
  members = [
    for repo in local.repos :
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/attribute.repository/${repo}"
  ]
}

