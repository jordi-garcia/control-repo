# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include motd
class motd (
    String $message
)

{

    $motd_hash = {
        'fqdn'          => $facts['networking']['fqdn'],
        'os_family'     => $facts['os']['family'],
        'os_name'       => $facts['os']['name'],
        'os_release'    => $facts['os']['release'],
        'message'       => $message
    }

    file { '/etc/motd':
        content => epp('motd/motd.epp', $motd_hash)
    }
}
