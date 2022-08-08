# class osquery::config - manage json config in /etc/osquery
class osquery::config {

  file { $::osquery::config:
    ensure  => present,
    content => to_json_pretty($::osquery::settings),
    owner   => $::osquery::config_user,
    group   => $::osquery::config_group,
    require => Package[$::osquery::package_name],
    notify  => Service[$::osquery::service_name],
  }

  if has_key($::osquery::settings, 'packs') {
    $packs = keys($::osquery::settings['packs'])
    osquery::pack { $packs: }
  }
}
