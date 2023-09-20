module "iam_groups" {
  source = "./IAM/group"
}
module "iam_users" {
  source = "./IAM/users"
  depends_on = [ module.iam_groups ]
  testing_group_1 = module.iam_groups.testing_group_1
  testing_group_2 = module.iam_groups.testing_group_2
}
