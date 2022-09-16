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

##install bash theme oy my bash
##"
execute 'setup_bash_theme_root' do
  cwd /root
  user root
  group root
  command 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)'
end


