#!/bin/bash
# upgrade all packages
yum clean all
yum makecache
yum -y update

# Install puppet
yum -y install puppet puppet-server
systemctl enable puppetmaster
systemctl stop puppetmaster

# Remove SSL directory (will be regenerated when restarted)
rm -rf /var/lib/puppet/ssl

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
puppet module install puppetlabs-nginx 
puppet module install puppetlabs-vcsrepo
