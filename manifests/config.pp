# class osquery::config - manage json config in /etc/osquery
class osquery::config(
  $format = 'simple',
){

  file { $::osquery::config_file:
    ensure  => present,
    content => sorted_json($::osquery::settings, $format), # format as JSON
    owner   => $::osquery::config_owner,
    group   => $::osquery::config_group,
    require => Package[$::osquery::package_name],
    notify  => Service[$::osquery::service_name],
  }

}
