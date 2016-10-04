package 'Install Apache' do
  package_name 'apache2'
end


file '/var/www/html/index.html' do
  action :delete
  ignore_failure true
end

service 'apache2' do
  action :nothing
end
