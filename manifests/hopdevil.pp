include '::ntp'
include 'denyhosts'

#class desktop {
	# below packages do not require configs
	package { alpine: ensure => latest }
	package { gcc: ensure => latest }
	package { git: ensure => latest }
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
#}
