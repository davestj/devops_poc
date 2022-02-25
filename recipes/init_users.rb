# Cookbook:: devops_poc
# Recipe:: init_users

group 'sysopsa' do
  action :create
  gid 420
end

user 'sysopsa' do
  manage_home true
  action :create
  comment 'SysOps Admin User'
  uid 420
  gid 420
  home '/home/sysopsa'
  shell '/bin/bash'
end

group 'wheel' do
  action :modify
  members 'sysopsa'
  append true
end

cookbook_file '/home/sysopsa' do
  source 'bashrc'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/home/sysopsa' do
  source 'bash_profile'
  owner 'root'
  group 'root'
  mode '0644'
end
