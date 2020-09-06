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

variable "consul_encrypted_key" {
  default = "qDOPBEr+/oUVeOFQOnVypxwDaHzLrD+lvjo5vCEBbZ0="
}
