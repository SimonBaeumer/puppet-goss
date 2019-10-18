class goss (
  String $version = 'latest',
  String $goss_path = '/usr/bin/goss',
  String $goss_conf_path = '/tmp/goss.yaml'
) {
  package { 'wget':
    ensure => 'installed',
  }

  -> package { 'file':
    ensure => 'installed',
  }

  -> if $version == 'latest' {
      goss::remote_file { $goss_path:
        remote_location => 'https://github.com/SimonBaeumer/goss/releases/latest/download/goss-linux-amd64',
        mode            => '0755',
        overwrite       => true,
      }
  } else {
      goss::remote_file { $goss_path:
        remote_location => "https://github.com/SimonBaeumer/goss/releases/download/${version}/goss-linux-amd64",
        mode            => '0755',
        overwrite       => true,
      }
  }

  -> exec { 'Check if download succeded':
    command => "/usr/bin/file ${goss_path} | grep 'ELF 64-bit'"
  }

  -> exec { "${goss_path} -g ${goss_conf_path} validate":
  }
}
