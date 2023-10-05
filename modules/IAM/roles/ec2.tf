data "aws_iam_policy_document" "ec2_role_document" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_instance_role" {
  name               = "ec2_instance_role"
  assume_role_policy = data.aws_iam_policy_document.ec2_role_document.json
}

resource "aws_iam_role_policy_attachment" "ec2_instance_IAMReadOnlyAccess" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}