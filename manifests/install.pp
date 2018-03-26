# osquery::install - installation class
class osquery::install {

  if $::osquery::repo_install {
    case $::operatingsystem {
      'ubuntu': {

        apt::source { 'osquery_repo':
          location => $::osquery::repo_url,
          repos    => 'main',
          key      => {
            'id'     => $::osquery::repo_key_id,
            'server' => $::osquery::repo_key_server,
          },
          before   => Package[$::osquery::package_name],
        }

        package { $::osquery::package_name:
          ensure => $::osquery::package_ver,
        }

      }
      'RedHat', 'Amazon', 'CentOS', 'Scientific', 'OracleLinux': {

        # Redhat clone flavors
        package { $::osquery::repo_name:
          ensure   => present,
          source   => $::osquery::repo_url,
          provider => 'rpm',
          before   => Package[$::osquery::package_name],
        }

      }
      'Windows': {
        package{ 'osquery':
          ensure          => present,
          provider        => chocolatey,
          install_options => ['-params','"','/InstallService','"'],
        }
      }
      default: {
        fail("${::operatingsystem} not supported")
      }
    } # end case $::osfamily
  } # end if $::osquery::params::repo_install

}
