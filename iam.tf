locals {
  developers_group_name = module.iam_groups.developers_group_name
  sells_group_name      = module.iam_groups.sells_group_name

}
module "iam_groups" {
  source = "./modules/IAM/groups"
}

module "iam_policies" {
  source                = "./modules/IAM/policies"
  depends_on            = [module.iam_groups]
  developers_group_name = local.developers_group_name
  sells_group_name      = local.sells_group_name

}
module "iam_users" {
  source                = "./modules/IAM/users"
  depends_on            = [module.iam_groups]
  developers_group_name = local.developers_group_name
  sells_group_name      = local.sells_group_name
}

module "iam_roles" {
  source = "./modules/IAM/roles"
}
