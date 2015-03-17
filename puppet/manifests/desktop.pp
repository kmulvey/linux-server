import 'linux.pp'

class desktop {
	# below packages do not require configs
	package { alpine: ensure => latest }
	package { google-chrome-beta: ensure => latest }
	package { google-droid-serif-fonts: ensure => latest }
	package { google-droid-sans-fonts: ensure => latest }
	package { google-droid-sans-mono-fonts: ensure => latest }
	package { firefox: ensure => latest }
	package { pidgin: ensure => latest }
	package { pidgin-libnotify: ensure => latest }
}
