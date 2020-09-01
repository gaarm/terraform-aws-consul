output "private_ips" {
  value = aws_instance.consul_node.*.private_ip
}

output "public_ips" {
  value = aws_instance.consul_node.*.public_ip
}
