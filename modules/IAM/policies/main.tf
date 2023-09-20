resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_uppercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  allow_users_to_change_password = true
}

data "aws_iam_policy_document" "developers_policies_json" {

  version = "2012-10-17"
  statement {
    sid       = "1"
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }


}
resource "aws_iam_policy" "developers_policies" {
  name        = "developers_policies"
  description = "Dev Policies"
  policy      = data.aws_iam_policy_document.developers_policies_json.json
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = var.developers_group_name
  policy_arn = aws_iam_policy.developers_policies.arn
}
