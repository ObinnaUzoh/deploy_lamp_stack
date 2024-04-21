#!/bin/bash

# Update package index and install necessary packages
sudo apt update
sudo apt upgrade
sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql git

# Clone PHP application from GitHub
git clone https://github.com/laravel/laravel.git /var/www/html/

# Set permissions for web server
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Configure Apache virtual host
cat <<EOF | sudo tee /etc/apache2/sites-available/your_php_app.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# Enable the new virtual host and disable the default one
sudo a2ensite your_php_app.conf
sudo a2dissite 000-default.conf

# Enable Apache rewrite module
sudo a2enmod rewrite

# Restart Apache server to apply changes
sudo systemctl restart apache2

# Secure MySQL installation (set root password, remove anonymous users, disallow root login remotely, remove test database)
#replace with a secure password
your_root_password=<mysql_password>
your_root_password=<mysql_password>
sudo mysql_secure_installation <<EOF

y
$your_root_password
$your_root_password
y
y
y
y
EOF

# Restart MySQL server for changes to apply
sudo systemctl restart mysql

echo "LAMP stack deployment completed."
