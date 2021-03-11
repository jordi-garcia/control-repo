# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include windows_towers
class windows_towers {
  dsc_psrepository { 'PowerShell Gallery':
    dsc_name               => 'psGallery',
    dsc_installationpolicy => 'Trusted',
  }
  dsc_userrightsassignment { "add-jordi-to-logon-as-service":
    ensure     => 'present',
    dsc_policy => 'Log_on_as_a_service',
    dsc_identity   => 'PR-201984-WIN19\\jordi',
  }

  service { 'PlexUpdateService':
    ensure        => 'stopped',
    logonaccount  => 'PR-201984-WIN19\\jordi',
    logonpassword => 'puppetpuppet',
    enable        => 'false',
  }
}
