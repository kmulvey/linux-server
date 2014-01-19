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
