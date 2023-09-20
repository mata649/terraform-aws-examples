locals {
  developers_group_name = module.iam_groups.developers_group_name
  sells_group_name      = module.iam_groups.sells_group_name

}
module "iam_groups" {
  source = "./IAM/group"
}

module "iam_policies" {
  source                = "./IAM/policies"
  depends_on            = [module.iam_groups]
  developers_group_name = local.developers_group_name
  sells_group_name      = local.sells_group_name

}
module "iam_users" {
  source                = "./IAM/users"
  depends_on            = [module.iam_groups]
  developers_group_name = local.developers_group_name
  sells_group_name      = local.sells_group_name
}

module "iam_roles" {
  source = "./IAM/roles"
}
