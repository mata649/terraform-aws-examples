variable "default_ec2_instance_sg_id" {
  type = string
}
variable "ec2_instance_role" {
  type = object({
    name = string
  })
}

variable "ec2_key_pair" {
  type = object({
    key_name = string
  })
}
