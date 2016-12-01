# class osquery::config - manage json config in /etc/osquery
class osquery::config (

  $settings = $::osquery::settings,

){

  file { $::osquery::params::config:
    ensure  => present,
    owner   => root,
    group   => root,
    content => hash2json($settings), # hash to JSON lib
    require => Package[$::osquery::params::package_name],
    notify  => Service[$::osquery::params::service_name],
  }

}
