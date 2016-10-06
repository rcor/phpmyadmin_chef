phpmyadmin_location =  '/tmp/phpmyadmin.zip'
remote_file phpmyadmin_location do
  source 'https://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-english.zip'
  action :create_if_missing
end

execute 'extract phpmyadmin' do
  command "unzip #{phpmyadmin_location} -d /tmp/"
end
execute 'move files' do
  command 'cp -rfv /tmp/phpMyAdmin-4.6.4-english/* /var/www/html/'
end
execute 'rm files' do
  command 'rm -rfv /tmp/phpMyAdmin-4.6.4-english/'
end


execute "change permission" do
  command <<-EOH
    WP_OWNER=www-data # &lt;
    WP_GROUP=www-data # &lt;
    WP_ROOT=/var/www/html # &lt;
    WS_GROUP=www-data # &lt;

    # reset to safe defaults
    find ${WP_ROOT} -exec chown ${WP_OWNER}:${WP_GROUP} {} \\;
    find ${WP_ROOT} -type d -exec chmod 755 {} \\;
    find ${WP_ROOT} -type f -exec chmod 644 {} \\;

    EOH
end
