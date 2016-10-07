
package 'Install Mysql' do
  package_name 'mysql-server'
  action :install
end
execute "create database #{node.default[:wordpress][:database]}" do
  command  "mysql --user #{node.default[:mysql][:user]}  "\
  "-e  'CREATE DATABASE IF NOT EXISTS  #{node.default[:mysql][:database]}'"
end
