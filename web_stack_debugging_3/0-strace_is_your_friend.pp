exec { 'strace_apache':
  command     => 'strace -p $(pgrep apache2) -s 1024 -o /tmp/strace_output.txt',
  path        => '/usr/bin',
  refreshonly => true,
  subscribe   => Service['apache2'],
}

file { '/tmp/strace_output.txt':
  ensure  => absent,
  require => Exec['strace_apache'],
}

file { '/var/www/html/missing_file.txt':
  ensure  => present,
  content => 'This is the missing file content',
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => File['/var/www/html/missing_file.txt'],
}

