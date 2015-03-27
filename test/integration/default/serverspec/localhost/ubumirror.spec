require 'spec_helper'

describe 'Ubumirror configuration' do
  describe file('/etc/ubumirror.conf') do
    it { should be_a_file }
    its(:content) { should match('UBUARC_DIR="/srv/mirror/ubuntu"') }
  end
end
