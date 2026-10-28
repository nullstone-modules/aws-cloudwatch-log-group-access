locals {
  policy_name = "${replace(local.resource_name, " ", "-")}-LogAccess"
}

resource "aws_iam_policy" "log_admin" {
  name   = local.policy_name
  policy = data.aws_iam_policy_document.log_admin.json
}

// Log Group actions require the Log Group ARN as of 2027-04-26; the ":*" form only covers Log Stream actions.
data "aws_iam_policy_document" "log_admin" {
  statement {
    sid       = "AllowAllLogs"
    effect    = "Allow"
    actions   = ["logs:*"]
    resources = [local.log_group_arn, "${local.log_group_arn}:*"]
  }
}

resource "aws_iam_role_policy_attachment" "log_admin" {
  role       = local.role_name
  policy_arn = aws_iam_policy.log_admin.arn
}
