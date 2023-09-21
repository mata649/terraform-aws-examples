resource "aws_ec2_" "name" {
  
}

resource "aws_instance" "created_using_terraform" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro" 
}

