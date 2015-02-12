if versioncmp($::puppetversion,'3.6.1') >= 0 {
  Package {
    allow_virtual => true,
  }
}

class { '::ntp':
	servers => [ 'time.nist.gov', 'time-d.nist.gov', 'nist.time.nosc.us', 'time-c.timefreq.bldrdoc.gov' ],
	restrict => ['127.0.0.1'],
}
class { "denyhosts":
	adminemail => "something"
}


class { 'ssh':
	storeconfigs_enabled => false,
	server_options => {
		'AllowTcpForwarding' => 'no',
		'AllowUsers' => 'kmulvey',
		#'Banner' => '/etc/issue',
		'HostbasedAuthentication' => 'no',
		'IgnoreRhosts' => 'yes',
		'LogLevel' => 'INFO',
		'PasswordAuthentication' => 'yes',
		'PermitEmptyPasswords' => 'no',
		'PermitRootLogin' => 'no',
		'Port' => [22],
		'Protocol' => 2,
		'RhostsAuthentication' => 'no',
		'RhostsRSAAuthentication' => 'no',
		'RSAAuthentication' => 'yes',
		'ServerKeyBits' => '4096',
		'StrictModes' => 'yes',
		'UsePrivilegeSeparation' => 'yes',
		'VerifyReverseMapping' => 'yes',
		'X11Forwarding' => 'no',
	},
	client_options => {
	  'ForwardAgent' => 'yes'
	},
}


class base {
	# below packages do not require configs
	package { curl: ensure => latest }
	package { '@development-tools': ensure => latest }
	package { gcc: ensure => latest }
	package { git: ensure => latest }
	package { git-email: ensure => latest }
	package { golang: ensure => latest }
	package { golang-godoc: ensure => latest }
	package { gnupg: ensure => latest }
	package { gnupg2: ensure => latest }
	package { htop: ensure => latest }
	package { 'java-1.7.0-openjdk': ensure => absent }
	package { 'java-1.8.0-openjdk': ensure => latest }
	package { fedora-packager: ensure => latest }
	package { kernel: ensure => latest }
	package { kernel-devel: ensure => latest }
	package { kernel-headers: ensure => latest }
	package { make: ensure => latest }
	package { mercurial: ensure => latest }
	package { nodejs: ensure => latest }
	package { nmap: ensure => latest }
	package { npm: ensure => latest }
	package { openssl: ensure => latest }
	package { puppet: ensure => latest }
	package { rsyslog: ensure => latest }
	package { systemd: ensure => latest }
	package { sudo: ensure => latest }
	package { tmux: ensure => latest }
	package { vim-enhanced: ensure => latest }
}

include 'base'
