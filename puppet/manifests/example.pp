import 'desktop.pp'

vcsrepo { "/home/kmulvey":
  ensure   => present,
  provider => git,
  source   => "https://github.com/kmulvey/dotfiles.git",
}

user { "kmulvey":
	ensure     	=> present,
	home		=> '/home/kmulvey',
	shell      	=> "/bin/bash",
}
