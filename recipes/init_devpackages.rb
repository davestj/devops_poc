# Cookbook:: devops_poc
# Recipe:: init_devpackages

package %w(nginx ruby nodejs java-11-openjdk-devel) do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end
