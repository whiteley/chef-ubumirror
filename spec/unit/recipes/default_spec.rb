require 'spec_helper'

describe 'ubumirror::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs ubumirror' do
    expect(chef_run).to upgrade_package('ubumirror')
  end

  it 'configures ubumirror' do
    expect(chef_run).to render_file('/etc/ubumirror.conf')
  end

  it 'prepares cron jobs' do
    expect(chef_run).to create_cron('ubuarchive')
  end
end
