# Cookbook:: devops_poc
# Recipe:: default


include_recipe 'devops_poc::init_main'
include_recipe 'devops_poc::init_network'
include_recipe 'devops_poc::init_storage'
include_recipe 'devops_poc::init_users'