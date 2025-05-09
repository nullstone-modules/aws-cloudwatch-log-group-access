locals {
  policy_name = "${replace(local.resource_name, " ", "-")}-LogAccess"
}

resource "aws_iam_policy" "log_admin" {
  name   = local.policy_name
  policy = data.aws_iam_policy_document.log_admin.json
}

data "aws_iam_policy_document" "log_admin" {
  statement {
    sid       = "AllowAllLogs"
    effect    = "Allow"
    actions   = ["logs:*"]
    resources = ["${local.log_group_arn}:*"]
  }
}

resource "aws_iam_role_policy_attachment" "log_admin" {
  role       = local.role_name
  policy_arn = aws_iam_policy.log_admin.arn
}
