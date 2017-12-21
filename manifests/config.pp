# class osquery::config - manage json config in /etc/osquery
class osquery::config {
  include stdlib

  file { $::osquery::config:
    ensure  => present,
    owner   => root,
    group   => root,
    content => sorted_json($::osquery::settings), # array to JSON lib
    require => Package[$::osquery::package_name],
    notify  => Service[$::osquery::service_name],
  }

  if has_key($::osquery::settings, 'packs') {
    $packs = keys($::osquery::settings['packs'])
    osquery_config { $packs:
      #format => $format,
    }
  }
}
