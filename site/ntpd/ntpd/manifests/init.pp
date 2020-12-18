# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ntpd
class ntpd {
  package { 'ntp':
    ensure  => present,
  }
  service { 'ntpd':
    ensure => 'running',
    enable => 'true',
}
}
