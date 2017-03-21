# # encoding: utf-8

# Inspec test for recipe lamp::web

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package 'httpd' do
  it { should be_installed }
end

describe service 'httpd-default' do
  it { should be_enabled }
  it { should be_running }
end

describe command 'curl -I localhost' do
  its('stdout') { should match /^HTTP\/1\.1 200 OK/ }
end

describe port 80 do
  it { should be_listening }
end
