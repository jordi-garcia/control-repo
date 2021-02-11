
# update sudoers to avoid lack of the puppet path after agent install

class p9linux_initialconfig::sudo_path  {

  file_line { 'sudo_path':
    path  => '/etc/sudoers',
    line  => 'Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin',
    match => 'Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin',
  }
}
