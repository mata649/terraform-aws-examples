resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "tf_key_pair_ec2" {
  key_name   = "tf_key_par_ec2"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "terraform_rsa_key_pem" {
  content = tls_private_key.rsa.private_key_pem
  filename = "tfkey.pem"
}