#
# Cookbook:: lamp
# Recipe:: web
#
# Copyright:: 2017, The Authors, All Rights Reserved.
document_root = node['lamp']['web']['document_root']

# Add the site configuration.
httpd_config 'default' do
  source 'default.conf.erb'
end

# Install Apache and start the service.
httpd_service 'default' do
  mpm 'prefork'
  action [:create, :start]
  subscribes :restart, 'httpd_config[default]'
end

# Create the document root directory.
directory document_root do
  recursive true
end

# Write the home page.
file ::File.join(document_root, 'index.html') do
  content '<html>This is a placeholder</html>'
  action :create_if_missing
end
