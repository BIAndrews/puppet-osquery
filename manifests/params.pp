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
  $config       = '/etc/osquery/osquery.conf'
  $repo_install = true

  case $::osfamily {
    'Debian': {
      # $lsbdistcodename fact example: 'trusty'
      $repo_url        = "https://osquery-packages.s3.amazonaws.com/${::lsbdistcodename} ${::lsbdistcodename} main"
      $repo_key_id     = 'C9D8B80B'
      $repo_key_server = 'keyserver.ubuntu.com'
    }
    'RedHat', 'Amazon': {
      $repo_name = "osquery-s3-centos${::operatingsystemmajrelease}-repo"
      $repo_url  = "https://osquery-packages.s3.amazonaws.com/centos${::operatingsystemmajrelease}/noarch/osquery-s3-centos${::operatingsystemmajrelease}-repo-1-0.0.noarch.rpm"
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}

