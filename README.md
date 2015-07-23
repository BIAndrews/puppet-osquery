[![Build Status](https://travis-ci.org/BIAndrews/puppet-osquery.svg)](https://travis-ci.org/BIAndrews/puppet-osquery)

# OSQuery

#### Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with osquery](#setup)
    * [What osquery affects](#what-osquery-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

OSQuery installation and configuration Puppet module.

## Setup

### What OSQuery affects

* osquery repo installed by default, can be disabled.
* osquery package installed.
* osquery JSON config file setup.
* osquery service ran.

### Setup Requirements

Uses apt module for Ubuntu to setup the repository or yum if Redhat family to install the repo RPM.

## Usage

Basic usage example with defaults.

~~~
include osquery
~~~

Usage example including some custom settings.

~~~
class { 'osquery':
  settings => {
    'options' => {
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
}
~~~

## Reference

* `osquery::settings` - hash converted into a JSON string for the OSQuery config file. Default is based on upstream package example config.
* `osquery::package_name` - Package name to install. Default is auto detect based on OSFamily.
* `osquery::service_name` - Service name to run. Default is auto detect based on OSFamily.
* `osquery::package_ver` - latest or present. Defaults to latest.
* `osquery::params::config` - Full path to config file. Defaults to /etc/osquery/osquery.conf.
* `osquery::params::repo_install` - Boolan, manage the repo or not. Default is true.
* `osquery::params::repo_url` - Repo URL.
* `osquery::params::repo_name` - Redhat repo RPM name.
* `osquery::params::repo_key_id` - Apt repo signature key ID.
* `osquery::params::repo_key_server` - Apt repo key server.

## Limitations

OSQuery is developed for CentOS6/7 as well as Ubuntu Trusty 14.04 LTS and Precise 12.04 LTS only. 
