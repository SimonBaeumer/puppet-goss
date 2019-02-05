CWD = $(shell pwd)
PE_MODULE_PATH = "/etc/puppetlabs/code/modules/goss"

deps:
	$(info INFO: Starting build $@)
	rm Gemfile.lock
	gem update --system
	bundle install --without system_tests --path vendor/bundle

test:
	$(info INFO: Starting build $@)
	bundle exec rake parallel_spec

lint:
	$(info INFO: Starting build $@)
	bundle exec rake syntax lint metadata_lint check:symlinks check:git_ignore check:dot_underscore check:test_file rubocop

integration-centos:
	$(info INFO: Starting build $@)
	docker build -t puppet_goss_centos .
	docker run -i -h puppetselfcontained.example -v $(CWD):/app -v $(CWD):$(PE_MODULE_PATH) puppet_goss_centos "/opt/puppetlabs/bin/puppet apply $(PE_MODULE_PATH)/dev.pp"
	docker stop puppet_goss_centos || true
	docker rm puppet_goss_centos