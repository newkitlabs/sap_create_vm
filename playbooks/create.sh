set -x

# ansible-galaxy collection install kubernetes.core
# yum install python3-kubernetes

rsync -av --delete -e 'ssh -o "UserKnownHostsFile /dev/null" -o stricthostkeychecking=no'  $HOME/data/git/cnv-dude dci@provisionhost:
ssh -t -o "UserKnownHostsFile /dev/null" -o stricthostkeychecking=no dci@provisionhost "sudo ln -sf /home/dci/cnv-dude/roles/ocp_create_sap_hana_vm /usr/share/ansible/roles/"
ssh -t -o "UserKnownHostsFile /dev/null" -o stricthostkeychecking=no dci@provisionhost "cd cnv-dude/playbooks && ansible-playbook -vv -i localhost, create_sap_hana_vm/create-sap-hana-vm.yml $@"
