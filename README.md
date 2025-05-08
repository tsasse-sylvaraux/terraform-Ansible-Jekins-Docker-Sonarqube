# Complete Project course : terraform+Ansible+Jekins+Docker+Sonarqube CI/CD Pipeline 
IaaC : use Terraform + Ansible to provisionning and config VM-servers (3 instances);
jenkins-server, Sonarqube-server, app-web-server

Config: 

Use git/gitHubs to manage versioning and push projet on gitHub repository


# Install terraform on linux
sudo apt-get update
sudo apt-get install -y wget unzip
wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
unzip terraform_1.6.6_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -v

# Install Ansible on linux
sudo apt update
sudo apt install -y ansible
ansible --version

