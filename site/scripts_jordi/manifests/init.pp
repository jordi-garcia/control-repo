# This Class is used to add default scripts to Primary server
# for mainly bolt commands

class scripts_jordi {
  # Trying to get public IP address using Puppet facts
  # using different syntax for practice

  $startextip = '10.234'
  $searchip = "/^$startextip/"

  if $facts['ec2_metadata']['public-ipv4'] =~ Regexp($startextip) {

    # requesting external IP and fqdn 
    $extip = $facts['ec2_metadata']['public-ipv4']
    $pe_fqdn = $facts['fqdn']

    # building the message_addtohosts variable
    # it should resemble: sed -i "2i10.234.3.2 pe-201984-master.puppetdebug.vlan /etc/hosts"

    $message_addtohosts = "sudo sed -i '2i$extip $pe_fqdn' /etc/hosts"

    # building the message_addtohosts variable
    $message_priv_key1= "-----BEGIN RSA PRIVATE KEY-----
MIIEoAIBAAKCAQEAsMvODgIqL1NoUgP65qmgf0sJjQy78QdA5rHw9tIwK5KstVSh
+0w4TLHJq8Jz8E4UeXhx0NioP3kE3otjCC8kSM5y99QOs4qQh7q6cLN9hQpXMQUD
9UnJMP0b5agd0PdErH0ML9hnWfsZX707v31VSIbco+X6Kg9wN8WJhlTXgbbrJTUI
PnMzNXrN7Z5/jY6Vss7NTCVI7OxUbIna37l5y8s4jxViaXjoVEXP8e4QtTX8p0BY"

    $message_priv_key2= "c2vgerI04ZilhbIe4KEcHiR+n/GUr6MmkY5qtLum/7IZLHbHfWha1q7VaPnz/CHm
lDySxxq4sF81N4x2V7d0+x8/wNZx2d+duJmV0QIBIwKCAQAUNIyT4v2BwGOxmg4L
u51QYFjc64MxfSv9G6aCm6271j+fseagYHt2erf2X121EDzarq3r+4DxT6jI+fyw
emqL+lZINX4F4/NCtkExc5lRCH7+SbdPO6H2+Fr1rNA1I5LR4mfK9CkRmQo208xQ
ZhhgD2msVMwiEGSYqNyEYXe3DWaG4QzEE/Ogt0ym6gDUkv0zoX1FhnHLCTHsTdod"

    $message_priv_key3= "QP65l8AH6J+dSM5SRvOr0N7m5pNtYMPQuWG0h/S9s6DBse+1giAyZUi0lMgzM/oQ
c1QRPE4G72tCcpdeNlH65ZKQb030rxfdVam+Lgr+6U4pXFdFu2ioX5M6n/NNctDz
Eyh7AoGBAN/R+S+JhkyXnrYEGFjgVrbwpjQazzEQF21StZbGPDSIV3qUEt9tXrty
ikH8rCCyJr5ej5e8urkD/OT7DNP8TbmV2ohb1QktlxTI2IhlttAgP7MRW/GmO9ex
XImc0U1xqT+O2uwzpJvHWczaG7kHo/4qLhpynZtkJWwnUJ2tfP77AoGBAMo3CqkB"

    $message_priv_key4= "PlLfmDk1Bp9pMbc+Y5EQ/bQsRHJGKw+ZhJBrg+21zw5b3R+RzrnV3lGerbRLog9U
WxCLD7JqqBLqj3PWk/oJWTlGRKgmw9Ib5nr9rEkxpz0A0ENTsIPmhMWHgspQSumP
6mm/rgufyhBGAHyLYYbHPVwbuXTM4lu8NPSjAoGAeYCdNxAkVXbhIPropUaVeUDP
QNtaiFkxSfmzCLTBmNxMvuKrKNT46WoQiji1NlIVCEH2LczaZG/hDpbptOgM77e/
xl28ynfVrDKELMmAf5x6WeTaJBhpoPnhxwv8l8Fb4Kyiurzy9XrY+i1CP9+Tifmj"

    $message_priv_key5= "/7qQEobSfIpe9oLAMqUCgYAz/4Zl+QFlxHeZroyspgV4Qz4snfgYYyeLGVuHqyIW
ggv7TAILAa3ji+SzcYJPgJMRGsNFxTv88I8B/is4EG4H2BdsLkokq6tBLoogFc2N
VyxNVeks8ZSjmS1jvu7w9vW+/rQtbiZVtPI9gNwwEgAgBpVrzNVDkhm+8tse50DR
MQKBgGBytk1EUEbozMndyARhazKqNoWAMYwqDgOF+WQM284L5TRLSoQNQnfHTs1p
o21mel3SmmVbablmb6SOf0/7DTEqmk6ZbVATQ1sxou7HLlImzcY82yAyoN9Lk2LX
/ZApenvy4FL4z7WkHP9Doby8TSRlvdinzNgNvEgtR1pq3CCr
-----END RSA PRIVATE KEY-----"

  }
  else {

    $global_message = "IP starting with: $startextip is out of range\n
     update variable \$startextip to a correct one module scripts_jordi"
    $message_addtohosts  = $global_message 
    $message_priv_key  = $global_message 

  }

  # Used to add Primary server IP to agents hosts file

  file { '/opt/scripts/addtohosts.sh':
    ensure  => 'present',
    content => $message_addtohosts,
  }

  # Private Key Used to remote onto agents via centos credentials

  file { '/root/.ssh/id_rsa-acceptance':
    ensure  => 'present',
    content => $message_priv_key1,
  }
}
