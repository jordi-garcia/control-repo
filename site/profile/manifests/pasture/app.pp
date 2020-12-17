#erwr
class profile::pasture::app (
  #Integer $port,
  #String $default_character ,
  #String $default_message ,
  #String $pasture_config_file ,
  #String $sinatra_server ,
  #String $db ,
) {


  class { 'pasture':
    port                => lookup('profile::pasture::app::port'),
    pasture_config_file => lookup('profile::pasture::app::pasture_config_file'),
    default_message     => lookup('profile::pasture::app::default_message'),
    sinatra_server      => lookup('profile::pasture::app::sinatra_server'),
    default_character   => lookup('profile::pasture::app::default_character'),
    db                  => lookup('profile::pasture::app::db'),
  }
}
