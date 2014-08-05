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

systemctl start puppetmaster

puppet module install puppetlabs-ntp 
puppet module install puppetlabs-denyhosts 
puppet module install puppetlabs-nginx 
puppet module install saz-ssh 
puppet module install puppetlabs-vcsrepo
