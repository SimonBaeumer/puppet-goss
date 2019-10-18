[![Build Status](https://travis-ci.org/SimonBaeumer/puppet-goss.svg?branch=master)](https://travis-ci.org/SimonBaeumer/puppet-goss)

# goss

Puppet module to install `goss`.

## Usage

```puppet
  class {'goss':
    version => 'v1.2.2', # default is latest
    goss_path => '/usr/bin/goss', # path where the binary is saved
    goss_conf_path => 'dev/goss_testing.yml', # default is /tmp/goss.yaml
  }
```

Take a look at the [dev.pp](dev.pp) and the [development](#development) section for more information(.

## Development

```
# Start a development environment which will give you a shell inside a testing container
$ ./docker-run.sh

# Execute puppet inside the container to apply the profile
$ puppet apply dev.pp
```

## Testing

```
# Start ruby container and get a shell
$ docker run -it -v $(pwd):/app ruby:2.5 /bin/bash

# Install dependencies
$ make deps

# Execute linter
$ make lint

# Execute tests
$ make tests
```

## Integration tests

```
$ make integration-centos
```