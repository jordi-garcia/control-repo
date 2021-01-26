# This Class is used to add default scripts to Primary server
# for mainly bolt commands

class scripts_jordi {
  # Equivalent resources:

  file { '/opt/scripts/newaddtohosts.sh':
    ensure => 'present',
  }
}
