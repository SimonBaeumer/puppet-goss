[![Build Status](https://travis-ci.org/SimonBaeumer/puppet-goss.svg?branch=master)](https://travis-ci.org/SimonBaeumer/puppet-goss)

# goss

Puppet module to install `goss`

## Development

```
# Start a development environment
$ ./docker-run.sh

# Execute puppet inside the container
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

Note: not fully implemented at the moment

```
$ make test-integration-centos
```

## ToDo

 - Integration tests