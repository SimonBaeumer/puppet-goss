  define goss::remote_file($remote_location=undef, $mode='0644', $overwrite=false) {
  if $overwrite == true {
    exec { "/bin/rm ${title} || true":
    }
  }

  exec{ "retrieve_${title}":
    command => "/usr/bin/wget -O ${title} -q ${remote_location}",
    creates => $title,
  }

  file{ $title:
    mode    => $mode,
    require => Exec["retrieve_${title}"],
  }
}
