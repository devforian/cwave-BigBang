#!/bin/sh
# Update existing packages
sudo yum -y update
# Install a LAMP stack
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum -y install httpd php-mbstring
# Start the web server
sudo chkconfig httpd on
sudo systemctl start httpd
# Install the web pages for our lab
if [ ! -f /var/www/html/immersion-day-app-php7.tar.gz ]; then
   cd /var/www/html
   wget https://aws-joozero.s3.ap-northeast-2.amazonaws.com/immersion-day-app-php7.tar.gz
   tar xvfz immersion-day-app-php7.tar.gz
fi
# Install the AWS SDK for PHP
if [ ! -f /var/www/html/aws.zip ]; then
   cd /var/www/html
   mkdir vendor
   cd vendor
   wget https://docs.aws.amazon.com/aws-sdk-php/v3/download/aws.zip
   unzip aws.zip
fi