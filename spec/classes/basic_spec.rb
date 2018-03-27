require 'spec_helper'

describe 'osquery', :type => :class do

  describe "class on Redhat 6 family with no parameters, basic test" do
    let :facts do
      {
        :kernel => 'Linux',
        :operatingsystem => 'Redhat',
        :operatingsystemmajrelease => '6',
        :architecture => 'x86_64',
        :processorcount => '2',
        :kernel => 'Linux'
      }
    end

    context "expected results" do
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('osquery') }
      it { is_expected.to contain_class('osquery::params') }
      it { is_expected.to contain_class('osquery::install') }
      it { is_expected.to contain_class('osquery::service') }
      it { is_expected.to contain_class('osquery::config') }
      it { is_expected.to contain_package('osquery') }
      it { is_expected.to contain_service('osqueryd') }
      it { is_expected.to contain_file('/etc/osquery/osquery.conf') }
    end
  end

  describe "class on Redhat 7 family with no parameters, basic test" do
    let :facts do
      {
        :kernel => 'Linux',
        :operatingsystem => 'Redhat',
        :operatingsystemmajrelease => '7',
        :architecture => 'x86_64',
        :processorcount => '2',
        :kernel => 'Linux'
      }
    end

    context "expected results" do
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('osquery') }
      it { is_expected.to contain_class('osquery::params') }
      it { is_expected.to contain_class('osquery::install') }
      it { is_expected.to contain_class('osquery::service') }
      it { is_expected.to contain_class('osquery::config') }
      it { is_expected.to contain_package('osquery') }
      it { is_expected.to contain_service('osqueryd') }
      it { is_expected.to contain_file('/etc/osquery/osquery.conf') }
    end
  end

  describe "class on CentOS 6 family with no parameters, basic test" do
    let :facts do
      {
        :kernel => 'Linux',
        :operatingsystem => 'CentOS',
        :operatingsystemmajrelease => '6',
        :architecture => 'x86_64',
        :processorcount => '2',
        :kernel => 'Linux'
      }
    end

    context "expected results" do
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('osquery') }
      it { is_expected.to contain_class('osquery::params') }
      it { is_expected.to contain_class('osquery::install') }
      it { is_expected.to contain_class('osquery::service') }
      it { is_expected.to contain_class('osquery::config') }
      it { is_expected.to contain_package('osquery') }
      it { is_expected.to contain_service('osqueryd') }
      it { is_expected.to contain_file('/etc/osquery/osquery.conf') }
    end
  end

  describe "class on CentOS 7 family with no parameters, basic test" do
    let :facts do
      {
        :kernel => 'Linux',
        :operatingsystem => 'CentOS',
        :operatingsystemmajrelease => '7',
        :architecture => 'x86_64',
        :processorcount => '2',
        :kernel => 'Linux'
      }
    end

    context "expected results" do
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('osquery') }
      it { is_expected.to contain_class('osquery::params') }
      it { is_expected.to contain_class('osquery::install') }
      it { is_expected.to contain_class('osquery::service') }
      it { is_expected.to contain_class('osquery::config') }
      it { is_expected.to contain_package('osquery') }
      it { is_expected.to contain_service('osqueryd') }
      it { is_expected.to contain_file('/etc/osquery/osquery.conf') }
    end
  end

  describe "class on Scientific linux family with no parameters, basic test" do
    let :facts do
      {
        :kernel => 'Linux',
        :operatingsystem => 'Scientific',
        :operatingsystemmajrelease => '6',
        :architecture => 'x86_64',
        :processorcount => '2',
        :kernel => 'Linux'
      }
    end

    context "expected results" do
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('osquery') }
      it { is_expected.to contain_class('osquery::params') }
      it { is_expected.to contain_class('osquery::install') }
      it { is_expected.to contain_class('osquery::service') }
      it { is_expected.to contain_class('osquery::config') }
      it { is_expected.to contain_package('osquery') }
      it { is_expected.to contain_service('osqueryd') }
      it { is_expected.to contain_file('/etc/osquery/osquery.conf') }
    end
  end

  describe "class on Amazon linux family with no parameters, basic test" do
    let :facts do
      {
        :kernel => 'Linux',
        :operatingsystem => 'Amazon',
        :operatingsystemmajrelease => '6',
        :architecture => 'x86_64',
        :processorcount => '2',
        :kernel => 'Linux'
      }
    end

    context "expected results" do
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('osquery') }
      it { is_expected.to contain_class('osquery::params') }
      it { is_expected.to contain_class('osquery::install') }
      it { is_expected.to contain_class('osquery::service') }
      it { is_expected.to contain_class('osquery::config') }
      it { is_expected.to contain_package('osquery') }
      it { is_expected.to contain_service('osqueryd') }
      it { is_expected.to contain_file('/etc/osquery/osquery.conf') }
    end
  end

  context 'unsupported operating system' do
    describe 'osquery class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :kernel => 'Other',
          :operatingsystem => 'Nexenta',
          :operatingsystemmajrelease => '6',
          :architecture => 'x86_64',
          :processorcount => '2',
          :kernel => 'Solaris'
        }
      end

      it { expect { is_expected.to contain_package('osquery') }.to raise_error(Puppet::Error, /Unsupported platform: Nexenta/) }
    end
  end

end
