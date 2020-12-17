# Class: pa
#
class pasture::db {

  class { 'postgresql::server':
    listen_addresses  => '*',
  }

  postgresql::server::db { 'pasture':
    user     =>  'pasture',
    password =>  postgresql_password('pasture', 'm00m00'),
  }


  postgresql::server::pg_hba_rule { 'allow pasture app access to agentdev2.garcia.local':
    type        =>  'host',
    database    =>  'pasture',
    user        =>  'pasture',
    address     =>  '192.168.238.112/32',
    auth_method =>  'password',
  }


  postgresql::server::pg_hba_rule { 'allow pasture app access to agent.garcia.local':
    type        =>  'host',
    database    =>  'pasture',
    user        =>  'pasture',
    address     =>  '192.168.238.116/32',
    auth_method =>  'password',
  }

}
