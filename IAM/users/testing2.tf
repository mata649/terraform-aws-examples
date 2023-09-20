resource "aws_iam_user" "testing2" {
  name = "testing2"
}

resource "aws_iam_access_key" "testing2_key" {
  user = aws_iam_user.testing2.name
}

resource "aws_iam_user_group_membership" "testing2_membership" {
  user = aws_iam_user.testing2.name
  groups = [var.testing_group_1]
}
