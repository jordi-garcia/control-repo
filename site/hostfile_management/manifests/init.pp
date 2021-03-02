# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hostfile_management
class hostfile_management {

  host { 'localhost':
  ensure       => 'present',
  host_aliases => ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],
  ip           => '127.0.0.1',
  target       => '/etc/hosts',
  }

  host { 'pe-201984-master':
  ensure       => 'present',
  host_aliases => ['pe-201984-master.puppetdebug.vlan'],
  ip           => '10.234.2.87',
  target       => '/etc/hosts',
  }

  host { 'centos7-test3':
  ensure       => 'present',
  host_aliases => ['centos7-test3.platform9.puppet.net'],
  ip           => '10.234.3.57',
  target       => '/etc/hosts',
  }

}
