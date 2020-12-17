# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include pasture
class pasture (
  Integer $port,
  String $default_character ,
  String $default_message ,
  String $pasture_config_file ,
  String $sinatra_server ,
  String $db ,
  #$port                = '80' ,
  #$pasture_config_file = '/etc/pasture_config.yaml' ,
){
  package { 'pasture':
    ensure   =>  present,
    provider =>  'gem',
    before   =>  File[$pasture_config_file],
  }

  $pasture_config_hash = {
    'port'              =>  $port,
    'default_character' =>  $default_character,
    'default_message'   =>  $default_message,
    'sinatra_server'    =>  $sinatra_server,
    'db'                =>  $db,
  }

  file { $pasture_config_file:
    content => epp('pasture/pasture_config.yaml.epp', $pasture_config_hash),
    notify  => Service['pasture']
  }

  $pasture_service_hash = {
    'pasture_config_file' => $pasture_config_file,
  }

  file { '/etc/systemd/system/pasture.service':
    content => epp('pasture/pasture.service.epp', $pasture_service_hash),
    notify  => Service['pasture']
  }

  service { 'pasture':
    ensure => running,
  }

  if ($sinatra_server == 'thin') or ($sinatra_server == 'mogrel') {
    package { $sinatra_server:
      provider =>  'gem',
      notify   =>  Service['pasture']
    }
  }
}
