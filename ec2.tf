module "ec2_security_groups" {
  source = "./modules/EC2/security_groups"
}

module "ec2_key_pairs" {
  source = "./modules/EC2/key_pairs"

}

module "ec2_instances" {
  source                     = "./modules/EC2/instances"
  default_ec2_instance_sg_id = module.ec2_security_groups.default_ec2_instance_sg_id
  ec2_instance_role          = module.iam_roles.ec2_instance_role
  ec2_key_pair               = module.ec2_key_pairs.tf_key_pair_ec2
}

