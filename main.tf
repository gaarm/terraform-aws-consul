provider "aws" {
  region = var.aws_region
}
resource "aws_key_pair" "key" {
  key_name   = "ssh-key"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "consul_node" {
  count         = var.node_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.key.key_name
  connection {
    agent       = "false"
    type        = "ssh"
    user        = var.user
    private_key = file(var.priv_key_path)
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "conf/consul.service"
    destination = "/tmp/consul.service"
  }
  provisioner "file" {
    source      = "conf/consul.hcl"
    destination = "/tmp/consul.hcl"
  }
  provisioner "file" {
    source      = "conf/server.hcl"
    destination = "/tmp/server.hcl"
  }
  provisioner "file" {
    source      = "scripts/wait.sh"
    destination = "/tmp/wait.sh"
  }
  provisioner "file" {
    source      = "scripts/provision.sh"
    destination = "/tmp/provision.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sh /tmp/wait.sh",
      "sed -i 's/CONSUL_VERSION/${var.consul_version}/g' /tmp/provision.sh",
      "sed -i 's/BOOTSTRAP_EXPECT/${var.node_count}/g' /tmp/server.hcl",
      "sudo sh /tmp/provision.sh",
    ]
  }

  tags = {
    Consul = true
    Name   = "consul-node-${count.index + 1}"
  }
}

resource "null_resource" "hosts_file" {
  depends_on = [aws_instance.consul_node]
  count      = var.node_count

  # Changes to any instance of the cluster requires re-provisioning
  connection {
    type        = "ssh"
    host        = element(aws_instance.consul_node.*.public_ip, count.index)
    user        = var.user
    private_key = file(var.priv_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sed -i 's|ENCRYPTED_KEY|${var.consul_encrypted_key}|g' /tmp/consul.hcl",
      "sed -i 's|PRIVATE_IPS|${join("\", \"", aws_instance.consul_node.*.private_ip)}|g' /tmp/consul.hcl",
      "sudo mv /tmp/consul.hcl /etc/consul.d",
      "sudo chown --recursive consul:consul /etc/consul.d",
      "sudo chmod 640 /etc/consul.d/consul.hcl",
      "sudo consul validate /etc/consul.d/consul.hcl",
      "sudo systemctl enable consul",
      "sudo systemctl start consul",
    ]
  }
}
