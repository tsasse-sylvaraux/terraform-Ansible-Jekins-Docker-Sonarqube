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

variable "vpc_id" {
  description = "ID du réseau"
  type        = string
  default     = "vpc-0123456789abcdef0"
}

variable "subnet_id" {
  description = "ID du sous-réseau"
  type        = string
  default     = "subnet-0123456789abcdef0"
}
