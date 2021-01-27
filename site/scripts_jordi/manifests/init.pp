# This Class is used to add default scripts to Primary server
# for mainly bolt commands

class scripts_jordi {
  # Trying to get public IP address using Puppet facts
  # using different syntax for practice

  $startextip = '10.234'
  $searchip = "/^$startextip/"

  if $facts['ec2_metadata']['public-ipv4'] =~ Regexp($startextip) {

    # requesting external IP and fqdn 
    $extip = $facts['ec2_metadata']['public-ipv4']
    $pe_fqdn = $facts['fqdn']

    # building the message_addtohosts variable
    # it should resemble: sed -i "2i10.234.3.2 pe-201984-master.puppetdebug.vlan /etc/hosts"

    $message_addtohosts = "sudo sed -i '2i$extip $pe_fqdn' /etc/hosts"

    # building the message_addtohosts variable
    $message_priv_key= "-----BEGIN RSA PRIVATE KEY-----

-----END RSA PRIVATE KEY-----"

  }
  else {

    $global_message = "IP starting with: $startextip is out of range\n
     update variable \$startextip to a correct one module scripts_jordi"
    $message_addtohosts  = $global_message 
    $message_priv_key  = $global_message 

  }

  # Used to add Primary server IP to agents hosts file

  file { '/opt/scripts/addtohosts.sh':
    ensure  => 'present',
    content => $message_addtohosts,
  }

  # Private Key Used to remote onto agents via centos credentials

  file { '/root/.ssh/id_rsa-acceptance':
    ensure  => 'present',
    content => $message_priv_key,
  }
}
