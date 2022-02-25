## Cookbook:: devops_poc
# Recipe:: init_network

cookbook_file '/etc/hosts' do
  source 'hosts'
  owner 'root'
  group 'root'
  mode '0644'
end