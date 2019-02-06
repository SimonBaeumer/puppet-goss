class goss (
  String $version = 'v0.4.0',
  String $goss_path = '/usr/bin/goss',
  String $goss_conf_path = '/tmp/goss.yaml'
) {
  package { 'wget':
    ensure => 'installed',
  }

  -> package { 'file':
    ensure => 'installed',
  }

  -> goss::remote_file { $goss_path:
    remote_location => "https://github.com/SimonBaeumer/goss/releases/download/${version}/goss-linux-amd64",
    mode            => '0755',
    overwrite       => true,
  }

  -> exec { 'Check if download succeded':
    command => "/usr/bin/file ${goss_path} | grep 'ELF 64-bit'"
  }

  -> file { $goss_conf_path:
    source => 'puppet:///modules/goss/goss.yaml',
    mode   => '0644',
  }

  -> exec { "${goss_path} -g ${goss_conf_path} validate":
  }
}
