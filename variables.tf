# aws region
variable "aws_region" {
  default = "eu-central-1"
}

# number of nodes
variable "node_count" {
  default = 4
}

# instance type
variable "instance_type" {
  default = "t2.micro"
}

# ami - public image ubuntu 18.04
variable "ami" {
  default = "ami-04932daa2567651e7"
}

# default linux user
variable "user" {
  default = "ubuntu"
}

# location to public key
variable "public_key_path" {
  default = "~/.ssh/amazon.pub"
}

# location to private key
variable "priv_key_path" {
  default = "~/.ssh/amazon"
}

# consul version
variable "consul_version" {
  default = "1.8.3"
}

# consul key encrypted
variable "consul_encrypted_key" {
  default = "qDOPBEr+/oUVeOFQOnVypxwDaHzLrD+lvjo5vCEBbZ0="
}
