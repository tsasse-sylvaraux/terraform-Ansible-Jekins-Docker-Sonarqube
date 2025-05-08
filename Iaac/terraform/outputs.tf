output "public_ips" {
  value = aws_instance.ci_cd_vm[*].public_ip
}