# == Class: osquery
#
# OSQuery installation and setup
#
# === Parameters
#
# [*package_name*]
#   OS package name to be installed. Default is auto detect.
#
# [*service_name*]
#   Package service name to be ran. Default is auto detect.
#
# [*settings_name*]
#   Hash of the OSquery settings to be converted automatically into a JSON string for the config file.
#
# === Variables
#
# See osquery::params for defaults
#
# === Examples
#
#  class { 'osquery':
#    settings => {
#      'options' => {
#        'debug' => false,
#        'worker_threads' => $::processorcount,
#      },
#      'schedule' => {
#        'info' => {
#          'query' => 'SELECT * FROM osquery_info',
#          'interval' => '3600',
#        },
#      },
#      'packs' => {
#        'incident-response' => '/usr/share/osquery/packs/incident-response.conf',
#        'it-compliance' => '/usr/share/osquery/packs/it-compliance.conf',
#      },
#    }
#  }
#
# === Authors
#
# Bryan Andrews <bryanandrews@gmail.com>
#
# === Copyright
#
# Copyright 2015 Bryan Andrews, unless otherwise noted.
#
class osquery (

  $package_name = $::osquery::params::package_name,
  $service_name = $::osquery::params::service_name,
  $settings     = $::osquery::params::settings,

) inherits ::osquery::params {

  class { '::osquery::install': } ->
  class { '::osquery::config': } ~>
  class { '::osquery::service': } ->
  Class['::osquery']

bad error
}
