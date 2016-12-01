# osquery::install - installation class
class osquery::install(
  $repo_install    = $osquery::repo_install,
  $repo_url        = $osquery::repo_url,
  $repo_key_id     = $osquery::repo_key_id,
  $repo_key_server = $osquery::repo_key_server,
  $package_name    = $osquery::package_name,
  $package_ver     = $osquery::package_ver,

){

  if $repo_install {
    case $::operatingsystem {
      'ubuntu': {

        apt::source { 'osquery_repo':
          location => $repo_url,
          repos    => 'main',
          key      => {
            'id'     => $repo_key_id,
            'server' => $repo_key_server,
          },
          before   => Package[$package_name],
        }

      }
      'RedHat', 'Amazon', 'CentOS', 'Scientific', 'OracleLinux': {

        # Redhat clone flavors
        package { $::osquery::params::repo_name:
          ensure   => present,
          source   => $repo_url,
          provider => 'rpm',
          before   => Package[$package_name],
        }

      }
      default: {
        fail("${::operatingsystem} not supported")
      }
    } # end case $::osfamily
  } # end if $::osquery::params::repo_install

  #
  # OSQuery package installation
  #

  package { $package_name:
    ensure => $package_ver,
  }

}
