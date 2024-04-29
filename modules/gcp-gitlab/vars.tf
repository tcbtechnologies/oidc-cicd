variable "gitlab_org" {
  # These are, annoyingly, case-sensitive, and Github can include uppercase characters. You can be sure you've got the correct capitalization by clicking on the repo name in the top right corner, which will bring you to the repository as Github stores it's name.
  description = "Repository owner (user or org). Case sensitive."
  default     = "tcbtech"
}

variable "gitlab_repos" {
  description = "Names of the repositories; Paths under the org. Case sensitive"
  default     = ["oidc-talk"]
  type        = list(string)
}

locals {
  gitlab_org = var.gitlab_org
  repos      = formatlist("${var.gitlab_org}/%s", var.gitlab_repos)
}
