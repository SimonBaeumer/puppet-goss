require 'spec_helper'

describe 'goss' do
  let(:title) { 'goss' }
  let(:node) { 'test.example.com' }

  it { is_expected.to compile }
  it { is_expected.to compile.with_all_deps }

  it { is_expected.to contain_package('wget').with(ensure: 'installed') }
  it { is_expected.to contain_package('file').with(ensure: 'installed') }

  it { is_expected.to contain_exec('/usr/bin/goss -g /tmp/goss.yaml validate') }
end
