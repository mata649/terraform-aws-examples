resource "aws_iam_user" "john_doe" {
  name = "john_doe"
}

resource "aws_iam_access_key" "john_doe_key" {
  user = aws_iam_user.john_doe.name
}

resource "aws_iam_user_group_membership" "john_doe_membership" {
  user = aws_iam_user.john_doe.name
  groups = [
    var.developers_group_name,
    var.sells_group_name
  ]
}
