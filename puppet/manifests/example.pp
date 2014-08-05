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
	password 	=> '$6$S7itf5yd$oG/JJvRqBfc.DEk.PySNRJUvkzU00IvCByDzTssYoZpL.t2SKbkzOqfUYvaMpKwI79pztfTDDaEYVO1zZwf6j0'
}
