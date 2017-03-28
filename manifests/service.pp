# osquery::service - manage services
class osquery::service {

  service { $::osquery::service_name:
    ensure     => $::osquery::service_enable,
    enable     => $::osquery::service_enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$::osquery::package_name],
  }

}
