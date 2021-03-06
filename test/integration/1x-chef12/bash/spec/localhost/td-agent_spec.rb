require 'serverspec'

set :backend, :exec

describe package('td-agent') do
  it { should be_installed }
end

describe service('td-agent') do
  it { should be_running }
end

describe file("#{node['td_agent']['etc_folder']}") do
  it { should be_a_directory }
end

describe file("#{node['td_agent']['etc_folder']}td-agent.conf") do
  it { should be_a_file }
  it { should be_mode 644 }
end

describe file("#{node['td_agent']['etc_folder']}/conf.d") do
  it { should be_a_directory }
  it { should be_mode 755 }
end

describe package('fluent-plugin-time_parser') do
  it { should_not be_installed.by('gem') }
end
