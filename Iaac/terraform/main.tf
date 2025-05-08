resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Autoriser SSH, HTTP, et ports CI/CD"
  vpc_id      = var.vpc_id # Assurez-vous de définir cette variable ou remplacez-la par l'ID du VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "instance_names" {
  type    = list(string)
  default = ["CI_CD_jenkins-server", "CI_CD_sonarqube-server", "CI_CD_docker-server"]
}

resource "aws_instance" "ci_cd_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  count         = length(var.instance_names)
  subnet_id     = var.subnet_id

  # ✅ Correct ici : utiliser vpc_security_group_ids
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.instance_names[count.index]
  }
}
