# Cookbook:: devops_poc
# Recipe:: init_main
#

cookbook_file '/root/.bashrc' do
  source 'bashrc'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/root/.bash_profile' do
  source 'bash_profile'
  owner 'root'
  group 'root'
  mode '0644'
end

