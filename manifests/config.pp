# class osquery::config - manage json config in /etc/osquery
class osquery::config {

  file { $::osquery::config:
    ensure  => present,
    owner   => $::osquery::conf_owner,
    group   => $::osquery::conf_group,
    content => sorted_json($::osquery::settings), # array to JSON lib
    require => Package[$::osquery::package_name],
    notify  => Service[$::osquery::service_name],
  }

}
