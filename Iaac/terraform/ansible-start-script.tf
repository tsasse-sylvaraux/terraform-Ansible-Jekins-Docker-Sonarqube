resource "null_resource" "ansible_provision" {
  depends_on = [aws_instance.ci_cd_vm]

  provisioner "local-exec" {
    command = <<EOT
      echo ">> Attente 60s pour se connecter aux VMs démarrer..."
      sleep 30
      
      echo ">> Génération de l'inventaire Ansible"
      chmod +x ./generate_Ansble-inventory.sh
      ./generate_Ansble-inventory.sh

      echo ">> Lancement d'Ansible"
      cd ../ansible && ansible-playbook -i inventory.ini playbook.yml
    EOT
  }
}
