variable "github_org" {
  # These are, annoyingly, case-sensitive, and Github can include uppercase characters. You can be sure you've got the correct capitalization by clicking on the repo name in the top right corner, which will bring you to the repository as Github stores it's name.
  description = "Repository owner (user or org). Case sensitive."
  default     = "tcbtechnologies"
}

variable "github_repos" {
  description = "Name of the repository. Case sensitive"
  default     = ["oidc-cicd"]
  type        = list(string)
}

locals {
  github_org = var.github_org
  repos      = formatlist("${var.github_org}/%s", var.github_repos)
}
