# This Class is used to add default scripts to Primary server
# for mainly bolt commands

class scripts_jordi {
  # Trying to get public IP address

  if $facts['ec2_metadata']['public-ipv4'] =~ /^10.234/ {
    $extip = $facts['ec2_metadata']['public-ipv4']
    $message = "This is the IP: <%= $extip %>"
  }
  else {
    $extip = 'Jordi'
  }

  file { '/opt/scripts/newaddtohosts.sh':
    ensure  => 'present',
    content => $message, #' sed -i "2i10.234.3.2 pe-201984-master.puppetdebug.vlan "' $extip '" /etc/hosts"',
  }
}
