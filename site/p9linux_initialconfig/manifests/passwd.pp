
# # Used to create a secondary root user with same access to 
# root by modifying /etc/passwd

class p9linux_initialconfig::passwd {

  file_line { 'Append /etc/passwdupdate':
      path    => '/etc/passwd',
      line    => 'root2:x:0:0:root:/root:/bin/bash',
  }
}
