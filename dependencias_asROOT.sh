#!/bin/bash

# Baixar o instalador do Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Verificar o hash do instalador do Composer
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

# Executar o instalador do Composer
php composer-setup.php

# Remover o instalador do Composer
php -r "unlink('composer-setup.php');"

# Mover o Composer para o diretório de binários do sistema
sudo mv composer.phar /usr/local/bin/composer

# Instalar dependências PHP
sudo apt install php-xml -y
sudo apt-get install php-mbstring -y


#Habilitando UserDIR no apache
a2enmod userdir
sudo sed -i 's/php_admin_flag engine Off/php_admin_flag engine On/' /etc/apache2/mods-available/php8.2.conf

# Reiniciar o Apache
sudo service apache2 restart

