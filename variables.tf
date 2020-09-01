variable "AWS_ACCESS_KEY_ID" {
  default = "$(aws configure get aws_access_key_id)"
}
variable "AWS_SECRET_ACCESS_KEY" {
  default = "$(aws configure get aws_secret_access_key)"
}

variable "node_count" {
  default = 4
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-04932daa2567651e7"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "user" {
  default = "ubuntu"
}

variable "public_key_path" {
  default = "~/.ssh/amazon.pub"
}

variable "priv_key_path" {
  default = "~/.ssh/amazon"
}

variable "cluster_member_name_prefix" {
  default = "consul"
}

variable "consul_version" {
  default = "1.8.3"
}
