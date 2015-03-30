require 'spec_helper'

describe 'ubumirror::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['ubumirror']['ubuarc_enable'] = true
    end.converge(described_recipe)
  end

  it 'installs ubumirror' do
    expect(chef_run).to create_user('ubumirror')
    expect(chef_run).to upgrade_package('ubumirror')
  end

  it 'configures ubumirror' do
    expect(chef_run).to render_file('/etc/ubumirror.conf')
    expect(chef_run).to create_directory('/srv/mirror/ubuntu')
    expect(chef_run).to create_directory('/srv/mirror/ubuntu-cdimage')
    expect(chef_run).to create_directory('/srv/mirror/ubuntu-releases')
    expect(chef_run).to create_directory('/srv/mirror/ubuntu-ports')
  end

  it 'prepares cron jobs' do
    expect(chef_run).to create_cron('ubuarchive')
  end
end
