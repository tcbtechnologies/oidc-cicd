variable "github_org" {
  description = "Github Org or user the repository belongs to"
  default     = "tcbtechnologies"
}

variable "github_repo" {
  description = "Repository under that org. '*' can be used"
  default     = "*"
}
