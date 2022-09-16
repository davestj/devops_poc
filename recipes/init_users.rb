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

##setup bash theme for sysopsa user
bash 'setup_bash_theme_sysopsa' do
    group sysopsa
    user sysopsa
    cwd '/home/sysopsa'
    code <<-EOH
     bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    EOH
end

##Setup RVM
#sync gpg keys
execute 'sync_rvm_gpg' do
  cwd /home/sysopsa
  user sysopsa
  group sysopsa
  command 'gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'
end

bash 'install_rvm_sysopsa' do
  ## additional install details
  ## https://rvm.io/rvm/install
    user sysopsa
    group sysopsa
    code <--EOH
     "\curl -sSL https://get.rvm.io | bash -s stable"
     EOH
end

##we could also use the 3rd party https://supermarket.chef.io/cookbooks/rvm

