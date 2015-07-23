# class osquery::config - manage json config in /etc/osquery
class osquery::config (

  $settings = $::osquery::params::settings,

){

  file { $::osquery::params::config:
    ensure  => present,
    owner   => root,
    group   => root,
    content => sorted_json($::settings), # array to JSON lib
    require => Package[$::osquery::params::package_name],
    notify  => Service[$::osquery::params::service_name],
  }

}
