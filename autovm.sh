@@ -54,6 +54,9 @@ sed -i 's/max_execution_time = 30/max_execution_time = 300/' /etc/php/7.2/fpm/ph
# Configure AutoVM
cd /var/www && rm -rf html && git clone https://github.com/FloriaanLry/autovm && cd autovm && php7.2 composer.phar install && echo $php_config > /var/www/autovm/config/db.php && mysql -u root -proot autovm < database.sql && mysql -u root -e "USE autovm;UPDATE user SET auth_key = '$password'" && php7.2 yii migrate --interactive=0 && chmod -R 0777 /var/www/autovm

# Configure Cron
cd /tmp && echo -e "*/5 * * * * php /var/www/autovm/yii cron/index\n0 0 * * * php /var/www/autovm/yii cron/reset" > cron && crontab cron

# Find address
address=$(ip address | grep "scope global" | grep -Po '(?<=inet )[\d.]+')
