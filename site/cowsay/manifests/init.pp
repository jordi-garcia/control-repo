# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cowsay
class cowsay {
  package { 'cowsay':
    ensure => present,
    provider => 'gem'
  }
}
