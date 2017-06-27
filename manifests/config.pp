# class osquery::config - manage json config in /etc/osquery
class osquery::config {

  file { $::osquery::config:
    ensure  => present,
    owner   => $::osquery::config_owner,
    group   => $::osquery::config_group,
    content => sorted_json($::osquery::settings), # array to JSON lib
    require => Package[$::osquery::package_name],
    notify  => Service[$::osquery::service_name],
  }

}
