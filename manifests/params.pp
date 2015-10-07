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

  $package_name = 'osquery'
  $service_name = 'osqueryd'
  $package_ver  = 'latest' # or present
  $config       = '/etc/osquery/osquery.conf'
  $repo_install = true

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Amazon', 'Scientific', 'OracleLinux', 'OEL': {
      $repo_name = "osquery-s3-centos${::operatingsystemmajrelease}-repo"
      $repo_url  = "https://osquery-packages.s3.amazonaws.com/centos${::operatingsystemmajrelease}/noarch/osquery-s3-centos${::operatingsystemmajrelease}-repo-1-0.0.noarch.rpm"
    }
    'ubuntu': {
      # $lsbdistcodename fact example: 'trusty'
      $repo_url        = "https://osquery-packages.s3.amazonaws.com/${::lsbdistcodename} ${::lsbdistcodename} main"
      $repo_key_id     = '1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B'
      $repo_key_server = 'keyserver.ubuntu.com'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}

