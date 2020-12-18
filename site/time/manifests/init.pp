# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include time
class time {
  $servers = ['time.google.com']

  case $facts['kernel'] {
    'windows': {
      class { 'winntp':
        servers => $servers,
      }
    }
    default: {
      class { 'ntp':
        servers => $servers,
      }
    }
  }
}
