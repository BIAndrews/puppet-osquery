# class osquery::config - manage json config in /etc/osquery
class osquery::config {
  include stdlib
  $format = 'simple',
){

  file { $::osquery::config:
    ensure  => present,
    content => sorted_json($::osquery::settings, $format), # format as JSON
    owner   => $::osquery::config_owner,
    group   => $::osquery::config_group,
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
