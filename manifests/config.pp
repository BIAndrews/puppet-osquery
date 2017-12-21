# class osquery::config - manage json config in /etc/osquery
class osquery::config(
  $format = 'simple',
){

  file { $::osquery::config_file:
    ensure  => present,
    owner   => root,
    group   => root,
    content => sorted_json($::osquery::settings, $format), # format as JSON
    require => Package[$::osquery::package_name],
    notify  => Service[$::osquery::service_name],
  }

}
