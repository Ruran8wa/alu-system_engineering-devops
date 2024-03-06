# /etc/puppetlabs/code/environments/production/manifests/100-puppet_ssh_config.pp

file {'/etc/ssh/ssh_config':
  ensure  => file,
  content => "ubuntu\n  IdentityFile ~/.ssh/school\n  PasswordAuthentication no\n",
  owner   => 'ruran8wa',
  group   => 'ruran8wa',
  mode    => '0600',
}
