# osquery::install - installation class
class osquery::install {

  if $::osquery::params::repo_install {
    case $::operatingsystem {
      'ubuntu': {

        apt::source { 'osquery_repo':
          location => $::osquery::params::repo_url,
          repos    => 'main',
          key      => {
            'id'     => $::osquery::params::repo_key_id,
            'server' => $::osquery::params::repo_key_server,
          },
          before   => Package[$::osquery::params::package_name],
        }

      }
      'RedHat', 'Amazon', 'CentOS', 'Scientific', 'OracleLinux': {

        # Redhat clone flavors
        package { $::osquery::params::repo_name:
          ensure   => present,
          source   => $::osquery::params::repo_url,
          provider => 'rpm',
          before   => Package[$::osquery::params::package_name],
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

  package { $::osquery::params::package_name:
    ensure => $::osquery::params::package_ver,
  }

}
