#!/usr/bin/env bash
echo "
export PATH=$PATH:/usr/local/bin/
alias kubectl='/usr/bin/k3s kubectl'
alias k='/usr/bin/k3s kubectl'" >> /home/vagrant/.bashrc
