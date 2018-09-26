# == Class: osquery
#
# OSQuery installation and setup
#
# === Parameters
#
# [*package_name*]
#   OS package name to be installed. Default is auto detect.
#
# [*package_ver*]
#   Package to ensure exists, can be latest or present. Default is latest.
#
# [*service_enable*]
#   Enable or disable the osqueryd service. Default is true.
#
# [*service_name*]
#   Package service name to be ran. Default is auto detect.
#
# [*settings*]
#   Hash of the OSquery settings to be converted automatically into a JSON string for the config file.
#
# [*repo_install*]
#   Whether or not to install the osquery yum/apt repository. Default is true.
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

  String $package_name    = $::osquery::params::package_name,
  String $service_name    = $::osquery::params::service_name,
  String $package_ver     = $::osquery::params::package_ver,
  Boolean $service_enable = $::osquery::params::service_enable,
  Hash $settings          = $::osquery::params::settings,
  Boolean $repo_install   = $::osquery::params::repo_install,

) inherits ::osquery::params {

  class { '::osquery::install': } -> class { '::osquery::config': } ~> class { '::osquery::service': } -> Class['::osquery']

}
