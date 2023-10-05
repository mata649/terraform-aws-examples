
locals {
}
resource "aws_iam_instance_profile" "default_ec2_profile" {
  name = "default_ec2_profile"
  role = var.ec2_instance_role.name
}
resource "aws_instance" "created_using_terraform" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.default_ec2_instance_sg_id]
  iam_instance_profile   = aws_iam_instance_profile.default_ec2_profile.name
  key_name               = var.ec2_key_pair.key_name
  user_data              = file("modules/EC2/instances/ec2-user-data.sh")
}

