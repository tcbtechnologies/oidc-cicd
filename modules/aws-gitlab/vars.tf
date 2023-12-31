variable "gitlab_org" {
  description = "Github Org or user the repository belongs to"
  default     = "tcbtech"
}

variable "gitlab_repo" {
  description = "Repository under that org. '*' can be used"
  default     = "*"
}
