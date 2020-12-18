#
class profile::base::base_install {
  include git
  include ntpd
}

