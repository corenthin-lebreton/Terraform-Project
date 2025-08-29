#!/bin/bash

while ! ping -c 1 -W 1 google.com > /dev/null 2>&1; do
    sleep 5
done

sudo apt update -y

sudo apt install -y apache2 php libapache2-mod-php mysql-client


sudo systemctl enable apache2 --now

mkdir -p /var/www/html
echo "<?php echo 'Server: ' . gethostname(); ?>" > /var/www/html/index.php

sudo rm /var/www/html/index.html