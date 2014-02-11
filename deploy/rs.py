import json
import libcloud.security
from libcloud.compute.types import Provider
from libcloud.compute.providers import get_driver
import libcloud.compute.types
from libcloud.compute.deployment import MultiStepDeployment, ScriptDeployment, SSHKeyDeployment
import os.path
import random, string


def namegen(length):
  return ''.join(random.choice(string.lowercase) for i in range(length))

# Import username and API key from a separate JSON file
creds = json.loads(open('creds.json').read())

# Don't verify the SSL cert. USE AT YOUR OWN RISK
libcloud.security.VERIFY_SSL_CERT = True

# Create a connection to the Chicago Rackspace endpoint
driver = get_driver(Provider.RACKSPACE)
rs = driver(creds['user'], creds['key'], region="dfw")

images = rs.list_images() # Get a list of images
sizes = rs.list_sizes() # Get a list of server sizes
size = [s for s in sizes if s.ram == 1024][0] # We want a 1GB server
image = [i for i in images if i.name == "Fedora 20 (Heisenbug)"][0] # We want the Fedora 

# Push our SSH key to /root/.ssh/authorized_keys
install_key = SSHKeyDeployment(open(os.path.expanduser("~/.ssh/id_rsa.pub")).read())

# Run the puppet install script
install_puppet = ScriptDeployment(open(os.path.expanduser("deploy-puppet.sh")).read())

# Multiple-step deployment that installs our SSH key and Puppet
multideploy = MultiStepDeployment([install_key, install_puppet])

# Creates our new server, runs deployment steps.
hostname = namegen(10)
node = rs.deploy_node(name=namegen(10), image=image, size=size, deploy=multideploy)
print "Hostname: ", hostname, " built."
