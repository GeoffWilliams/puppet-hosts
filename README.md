# hosts

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with hosts](#setup)
    * [What hosts affects](#what-hosts-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with hosts](#beginning-with-hosts)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Support for adding illegal and arbitary customised host entries to /etc/hosts
using a template and a supplied array of entries.

WARNING:  Completely replaces `/etc/hosts` on a target system

## Setup

### What hosts affects

* Completely replaces `/etc/hosts` on a target system


## Usage

This module is intended to be driven via a profile using external data from Hiera.  A sample profile might look like this:

```puppet
class profile::hosts {
  $custom_entries = hiera("profile::hosts::custom_entries")
  class { "hosts":
    custom_entries => $custom_entries,
  }
}
```

### custom_entries variable format
See `examples/init.pp` and `examples/init_hiera.pp` for worked examples

* Variable is an array so that order of entries is preserved
* Each element of the array needs to contain a hash with the following elements:
    * `ip` - The IP address
    * `short_name` - The short name of the host
    * `fqdn` - The fully qualified hostname of the host
* The variable itself can be sourced directly from Puppet Code or Hiera as 
  desired, see below:

#### Puppet Code
```puppet
$custom_entries = [
  {
    "ip"         => "192.168.1.2",
    "short_name" => "demo",
    "fqdn"       => "demo.hosts-example.com",
  },
  {
    "ip"         => "192.168.1.3",
    "short_name" => "demo",
    "fqdn"       => "demo.hosts-example.com.internal",
  },
  {
    "ip"         => "10.15.15.150",
    "short_name" => "demo",
    "fqdn"       => "demo.hosts-example.com.cdn",
  }
]
```

#### Hiera Code
```yaml
profile::hosts::custom_entries:
  - ip:         "192.168.1.2"
    short_name: "demo"
    fqdn:       "demo.hosts-example.com"
  - ip:         "192.168.1.3"
    short_name: "demo"
    fqdn:       "demo.hosts-example.com.internal"
  - ip:         "10.15.15.150"
    short_name: "demo"
    fqdn:       "demo.hosts-example.com.cdn"
```

## Reference

### manifests/init.pp
Class that manages the /etc/hosts file

### templates/hosts.erb
Templated `/etc/hosts` file.  Add additional hardcoded base entries here.

### examples/init.pp
Module smoke tests with hardcoded example data.  To run tests:
```shell
puppet apply examples/init.pp
```

## Limitations
This module contains conceptual example code and is not supported in any way.


## Development
This is a sample module only and is not being developed further.

## Testing
This module ships with RSpec tests.  To run them, first prepare your system:
```shell
bundle install
```

You may then run the tests at will.  If downloading from GitHub from behind a
proxy server, you will need to have your `http_proxy` and `https_proxy` 
variables exported
```shell
bundle exec rake spec
```

It is suggested to have your CI server execute these tests before allowing code
to be published to the puppet master.  **DO NOT ATTEMPT TO RUN RSPEC TEST ON THE PUPPET MASTER!**
