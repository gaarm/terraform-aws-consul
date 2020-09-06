output "private_ips" {
  value = aws_instance.consul_node.*.private_ip
}

output "public_ips" {
  value = aws_instance.consul_node.*.public_ip
}

output "consul_address" {
  value = "http://${aws_instance.consul_node.0.public_ip}:8500"
}
