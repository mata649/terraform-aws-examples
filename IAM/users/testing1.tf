resource "aws_iam_user" "testing1" {
  name = "testing1"
}

resource "aws_iam_access_key" "testing1_key" {
  user = aws_iam_user.testing1.name
}

resource "aws_iam_user_group_membership" "testing1_membership" {
  user = aws_iam_user.testing1.name
  groups = [
    var.testing_group_1,
    var.testing_group_2
  ]
}
