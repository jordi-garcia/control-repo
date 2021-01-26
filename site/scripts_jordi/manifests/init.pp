# This Class is used to add default scripts to Primary server
# for mainly bolt commands

class scripts_jordi {
  # Equivalent resources:

  file { '/opt/scripts/newaddtohosts.sh':
    ensure  => 'present',
    content => 'sed -i "2i10.234.3.2 pe-201984-master.puppetdebug.vlan" /etc/hosts',
  }
}
