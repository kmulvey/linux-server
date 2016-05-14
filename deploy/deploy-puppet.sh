#!/bin/bash
# upgrade all packages
dnf clean all
dnf makecache
dnf -y update

# Install puppet
dnf -y install puppet puppet-server git golang
systemctl enable puppetmaster
systemctl stop puppetmaster

# Remove SSL directory (will be regenerated when restarted)
rm -rf /var/lib/puppet/ssl

# regen ssl keys
rm -rf /etc/ssh/ssh_host*
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

# Configure Puppet to talk to our puppet master (this case, single instance)
cat >> /etc/puppet/puppet.conf <<-EOF
[agent]
server = localhost
EOF

#cat >> /etc/yum.repos.d/google-chrome.repo
#[google-chrome]
#name=google-chrome - \$basearch
#baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
#enabled=1
#gpgcheck=1
#gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
#EOF

systemctl start puppetmaster

puppet module install puppetlabs-ntp 
puppet module install puppetlabs-denyhosts 
puppet module install jfryman-nginx 
puppet module install saz-ssh
puppet module install puppetlabs-vcsrepo

go get -u golang.org/x/tools/cmd/gorename github.com/alecthomas/gometalinter github.com/kisielk/errcheck github.com/nsf/gocode honnef.co/go/implements golang.org/x/tools/cmd/goimports github.com/rogpeppe/godef
# sudo dnf --showduplicates --allowerasing --releasever=22 downgrade xorg-x11-server-Xorg
