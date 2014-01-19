#!/bin/bash
# upgrade all packages
yum clean all
yum makecache
yum -y update

# Install puppet
yum -y install puppet puppet-server
systemctl enable puppet
systemctl enable puppetmaster
systemctl stop puppet
systemctl stop puppetmaster

# Remove SSL directory (will be regenerated when restarted)
rm -rf /var/lib/puppet/ssl

# Configure Puppet to talk to our puppet master (this case, single instance)
cat >> /etc/puppet/puppet.conf <<-EOF
[agent]
server = localhost
EOF

systemctl start puppet
systemctl start puppetmaster
