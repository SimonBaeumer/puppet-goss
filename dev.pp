
node 'puppetselfcontained' {
  class {'goss':
    goss_conf_path => 'dev/goss_testing.yml',
  }
}
