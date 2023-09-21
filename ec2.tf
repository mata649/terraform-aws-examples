module "ec2_instances" {
  source = "./modules/EC2/instances"
}

module "ec2_security_groups" {
  source = "./modules/EC2/security_groups"
}