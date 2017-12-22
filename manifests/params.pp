# class osquery::params - parameters
class osquery::params {

  # hash converted to a JSON string for the OSQuery config file
  # defaults taken from the OSquery package example
  $settings = {
    'options' => {
      'config_plugin' => 'filesystem',
      'logger_plugin' => 'filesystem',
      'event_pubsub_expiry' => '86000',
      'debug' => false,
      'worker_threads' => $::processorcount,
    },
    'schedule' => {
      'info' => {
        'query' => 'SELECT * FROM osquery_info',
        'interval' => '3600',
      },
    },
  }

  $package_name   = 'osquery'
  $service_name   = 'osqueryd'
  $package_ver    = 'latest' # or present
  $service_enable = true
  $repo_install   = true

  case $::kernel {
    'Windows': { 
      $config       = 'C:\ProgramData\osquery\osquery.conf',
      $config_user  = 'SYSTEM',
      $config_group = 'Administrators',
    }
    default: { 
      $config       = '/etc/osquery/osquery.conf' 
      $config_user  = 'root',
      $config_group = 'root',
    }
  }

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Amazon', 'Scientific', 'OracleLinux', 'OEL': {
      $repo_name = "osquery-s3-centos${::operatingsystemmajrelease}-repo"
      $repo_url  = "https://osquery-packages.s3.amazonaws.com/centos${::operatingsystemmajrelease}/noarch/osquery-s3-centos${::operatingsystemmajrelease}-repo-1-0.0.noarch.rpm"
    }
    'ubuntu': {
      # $lsbdistcodename fact example: 'trusty'
      $repo_url        = "[arch=${::architecture}] https://osquery-packages.s3.amazonaws.com/${::lsbdistcodename}"
      $repo_key_id     = '1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B'
      $repo_key_server = 'keyserver.ubuntu.com'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

}
