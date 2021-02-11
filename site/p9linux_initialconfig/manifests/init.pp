# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include p9linux_initialconfig
class p9linux_initialconfig {

  include p9linux_initialconfig::sshd_config 
  include p9linux_initialconfig::authorized_keys
  include p9linux_initialconfig::passwd 
  include p9linux_initialconfig::root2 
  include p9linux_initialconfig::sudo_path

}
