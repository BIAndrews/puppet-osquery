# osquery::service - manage services
class osquery::service(
  $service_name    = $osquery::service_name,
  $package_name    = $osquery::package_name,
){

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package_name],
  }

}
