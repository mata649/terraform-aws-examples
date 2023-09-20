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

resource "aws_iam_role" "ec2_instance" {
  name               = "ec2_instance_role"
  assume_role_policy = data.aws_iam_policy_document.ec2_role_document.json
}
