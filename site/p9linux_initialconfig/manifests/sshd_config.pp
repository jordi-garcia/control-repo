# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include p9linux_initialconfig::sshd_config

# Used to managed the updates to sshd_config 

class p9linux_initialconfig::sshd_config {

  # Allow passwords to be used

  file_line { 'Modify PasswordAuthentication /etc/ssh/sshd_config':
  path    => '/etc/ssh/sshd_config',
  line    => "PasswordAuthentication yes",
  match   => '^PasswordAuthentication no',
  notify  => Service['sshd'],
  }

  # Allow root login and pass private keys

  file_line { 'Modify PermitRootLogin /etc/ssh/sshd_config':
    path    => '/etc/ssh/sshd_config',
    line    => "PermitRootLogin yes\nPermitRootLogin without-password",
    match   => '^#PermitRootLogin yes',
    notify  => Service['sshd'],
  }

  # Restart the service upon changes

  service { 'sshd':
    ensure  => 'running',
    enable  => true,
    subscribe => File_line['Modify PermitRootLogin /etc/ssh/sshd_config'],
  }
}
