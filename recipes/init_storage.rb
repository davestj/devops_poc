# Cookbook:: devops_poc
# Recipe:: init_storage

package %w(python-pip vim unzip mailx mlocate redis sysstat dos2unix) do
  action :install
end

service 'redis' do
  action [ :enable, :start ]
end
