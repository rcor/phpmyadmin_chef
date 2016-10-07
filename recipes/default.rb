#
# Cookbook Name:: phpmyadmin
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'apt-get-update-periodic' do
  command 'apt-get update'
  ignore_failure true
  only_if do
    File.exist?('/var/lib/apt/periodic/update-success-stamp') &&
      File.mtime('/var/lib/apt/periodic/update-success-stamp') <
        Time.now - 86_400
  end
end

package 'unzip' do
  action :install
end
include_recipe 'phpmyadmin::apache'
include_recipe 'phpmyadmin::php5'
include_recipe 'phpmyadmin::mysql'
include_recipe 'phpmyadmin::phpmyadmin'
