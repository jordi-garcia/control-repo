# This Class is used to add default scripts to Primary server
# for mainly bolt commands

class scripts_jordi {
  # Trying to get public IP address using Puppet facts
  # using different syntax for practice

  $startextip = "10.234"
  $searchip = '/^$startextip/'

  if $facts['ec2_metadata']['public-ipv4'] =~ $searchip {

    # requesting external IP and fqdn 
    $extip = $facts['ec2_metadata']['public-ipv4']
    $fqdn = $facts['fqdn']

    # building the message_addtohosts variable
    # it should resemble: sed -i "2i10.234.3.2 pe-201984-master.puppetdebug.vlan /etc/hosts"

    $message_addtohosts = "sed -i '2i$extip $fqdn'"

  }
  else {

    $message_addtohosts  = 'Didn't get and IP starting with: $startextip'

  }

  file { '/opt/scripts/addtohosts.sh':
    ensure  => 'present',
    content => $message_addtohosts,
  }
}
