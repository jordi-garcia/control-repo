

# Used to create a secondary root user 

class p9linux_initialconfig::root2  {
  
  # Linux requires a hash to set passwords
  # So, password = 'Qu@lity!' turns to
  #     password = '$1$fm9zRECW$qFQnf/OOkuR9MeGcuCjjf0'

  user { 'root2':
      ensure     => present,
      password   => '$1$fm9zRECW$qFQnf/OOkuR9MeGcuCjjf0' ,
    }
}
