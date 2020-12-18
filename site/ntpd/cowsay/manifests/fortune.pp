# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cowsay::fortune
class cowsay::fortune {
  package { 'fortune-mod':
    ensure => present,
  }
}
