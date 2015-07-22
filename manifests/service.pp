# osquery::service - manage services
class osquery::service {

  service { $::osquery::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$::osquery::params::package_name],
  }

}
