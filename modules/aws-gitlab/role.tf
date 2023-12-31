resource "aws_iam_role" "gitlab" {
  name = "gitlab"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = "Github"
        Principal = {
          Federated = aws_iam_openid_connect_provider.gitlab.arn
        }
        Condition = {
          "StringEquals" : {
            "gitlab.com:aud" : "sts.amazonaws.com",
          },
          "StringLike" : {
            "gitlab.com:sub" : "project_path:${var.gitlab_org}/${var.gitlab_repo}:*"
          }
        }
      },
    ]
  })
}

output "cicd-role" {
  description = "Role assumed by CICD Jobs"
  value       = aws_iam_role.gitlab.arn
}
