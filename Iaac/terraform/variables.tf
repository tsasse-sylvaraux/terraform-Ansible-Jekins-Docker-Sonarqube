variable "ami_id" {
  description = "ID du OS linux"
  type        = string
  default     = "ami-0c1ac8a41498c1a9c"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "ssh_key_name" {
  description = "Nom exact de la clé SSH sur AWS EC2"
  type        = string
  default     = "terraform-key-vm"
}


variable "instance_names" {
  type    = list(string)
  default = ["CI_CD_jenkins-server", "CI_CD_sonarqube-server", "CI_CD_docker-server"]
}