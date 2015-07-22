#include osquery

class { 'osquery':
  settings => {
    'options'  => {
      'event_pubsub_expiry' => '86000',
      'debug'               => false,
      'worker_threads'      => $::processorcount,
    },
    'schedule' => {
      'info' => {
        'query'    => 'SELECT * FROM osquery_info',
        'interval' => '3600',
      },
    },
  }
}

