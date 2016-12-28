# purgefiles

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with purgefiles](#setup)
    * [What purgefiles affects](#what-purgefiles-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with purgefiles](#beginning-with-purgefiles)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

purge files using find

## Module Description

This module creates cronjobs to purge files out of logrotate control (auto rotated files or temporal files that have no pattern)

## Setup

### What purgefiles affects

* creates cron jobs

### Setup Requirements **OPTIONAL**

This module requires pluginsync enabled

### Beginning with purgefiles

puppet syntax example:

```puppet
class { 'purgefiles': }

purgefiles::cronjob { '/lol':
  file_iname => '*gz',
}
```

hiera syntax example:

```hiera
purgefiles:
  '/opt/logging':
    mtime: '+29'
```

this will add the following cronjob to root:

```
# Puppet Name: cronjob purgefiles /opt/logging /opt/logging +29 f 0 0    present
0 0 * * * find /opt/logging  -type f -mtime +29 -delete
```

## Usage

Base class is not needed, there's no need to include it. Just use the **purgefiles::cronjob**

## Reference

### purgefiles::cronjob

* **path**        = $name,
* **action**      = "-delete",
* **mtime**       = undef,
* **type**        = "f",
* **hour**        = '0',
* **minute**      = '0',
* **month**       = undef,
* **monthday**    = undef,
* **weekday**     = undef,
* **ensure**      = 'present',
* **file_iname**  = undef,
* **cronjobname** = undef,

## Limitations

Tested on CentOS 6 and 7, but should work anywhere

## Development

We are pushing to have acceptance testing in place, so any new feature must
have tests to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
