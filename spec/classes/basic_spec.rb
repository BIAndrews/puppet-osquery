require 'spec_helper'

describe 'osquery', :type => :class do

  describe "class on Redhat 6 family with no parameters, basic test" do
    let :facts do
      {
        :operatingsystem => 'Redhat',
        :operatingsystemmajrelease => '6',
        :architecture => 'x86_64',
        :processorcount => '2'
      }
    end

    it {
      should contain_package('osquery')
      should contain_service('osqueryd')
      is_expected.to compile.with_all_deps
      is_expected.to contain_class('osquery::params')
    }
  end

  describe "class on Redhat 7 family with no parameters, basic test" do
    let :facts do
      {
        :operatingsystem => 'Redhat',
        :operatingsystemmajrelease => '7',
        :architecture => 'x86_64',
        :processorcount => '2'
      }
    end

    it {
      should contain_package('osquery')
      should contain_service('osqueryd')
      is_expected.to compile.with_all_deps
      is_expected.to contain_class('osquery::params')
    }
  end

  describe "class on CentOS 6 family with no parameters, basic test" do
    let :facts do
      {
        :operatingsystem => 'CentOS',
        :operatingsystemmajrelease => '6',
        :architecture => 'x86_64',
        :processorcount => '2'
      }
    end

    it {
      should contain_package('osquery')
      should contain_service('osqueryd')
      is_expected.to compile.with_all_deps
      is_expected.to contain_class('osquery::params')
    }
  end

  describe "class on CentOS 7 family with no parameters, basic test" do
    let :facts do
      {
        :operatingsystem => 'CentOS',
        :operatingsystemmajrelease => '7',
        :architecture => 'x86_64',
        :processorcount => '2'
      }
    end

    it {
      should contain_package('osquery')
      should contain_service('osqueryd')
      is_expected.to compile.with_all_deps
      is_expected.to contain_class('osquery::params')
    }
  end

  describe "class on Scientific linux family with no parameters, basic test" do
    let :facts do
      {
        :operatingsystem => 'Scientific',
        :operatingsystemmajrelease => '6',
        :architecture => 'x86_64',
        :processorcount => '2'
      }
    end

    it {
      should contain_package('osquery')
      should contain_service('osqueryd')
      is_expected.to compile.with_all_deps
      is_expected.to contain_class('osquery::params')
    }
  end

  describe "class on Amazon linux family with no parameters, basic test" do
    let :facts do
      {
        :operatingsystem => 'Amazon',
        :operatingsystemmajrelease => '6',
        :architecture => 'x86_64',
        :processorcount => '2'
      }
    end

    it {
      should contain_package('osquery')
      should contain_service('osqueryd')
      is_expected.to compile.with_all_deps
      is_expected.to contain_class('osquery::params')
    }
  end

  context 'unsupported operating system' do
    describe 'osquery class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :operatingsystem => 'Nexenta',
          :operatingsystemmajrelease => '6',
          :architecture => 'x86_64',
          :processorcount => '2'
        }
      end

      it { expect { is_expected.to contain_package('osquery') }.to raise_error(Puppet::Error, /Unsupported platform: Nexenta/) }
    end
  end

end
