
class { '::ntp':
	servers => [ 'time.nist.gov', 'time-d.nist.gov', 'nist.time.nosc.us', 'time-c.timefreq.bldrdoc.gov' ],
	restrict => ['127.0.0.1'],
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

class desktop {
	# below packages do not require configs
	package { alpine: ensure => latest }
	package { gcc: ensure => latest }
	package { git: ensure => latest }
	package { golang: ensure => latest }
	package { google-chrome-beta: ensure => latest }
	package { google-droid-serif-fonts: ensure => latest }
	package { google-droid-sans-fonts: ensure => latest }
	package { google-droid-sans-mono-fonts: ensure => latest }
	package { gnupg2: ensure => latest }
	package { htop: ensure => latest }
	package { 'java-1.7.0-openjdk': ensure => latest }
	package { 'java-1.8.0-openjdk': ensure => latest }
	package { firefox: ensure => latest }
	package { kernel: ensure => latest }
	package { kernel-headers: ensure => latest }
	package { make: ensure => latest }
	package { nodejs: ensure => latest }
	package { npm: ensure => latest }
	package { openssl: ensure => latest }
	package { pidgin: ensure => latest }
	package { sudo: ensure => latest }
	package { tmux: ensure => latest }
	package { vim-enhanced: ensure => latest }
}
