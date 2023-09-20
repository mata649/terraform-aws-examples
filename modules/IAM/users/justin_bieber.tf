resource "aws_iam_user" "justin_bieber" {
  name = "justin_bieber"
}

resource "aws_iam_access_key" "justin_bieber_key" {
  user = aws_iam_user.justin_bieber.name
}

resource "aws_iam_user_group_membership" "justin_bieber_membership" {
  user   = aws_iam_user.justin_bieber.name
  groups = [var.developers_group_name]
}
