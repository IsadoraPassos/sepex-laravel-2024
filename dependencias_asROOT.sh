#!/bin/bash
echo 'deb [trusted=yes] http://bsi.cefet-rj.br/repo/~debian labredes main' > /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian/               bookworm                main contrib non-free non-free-firmware' >> /etc/apt/sources.list
echo 'deb http://security.debian.org/debian-security  bookworm-security       main contrib non-free non-free-firmware' >> /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian/               bookworm-updates        main contrib non-free non-free-firmware' >> /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian/               bookworm-backports      main contrib non-free non-free-firmware' >> /etc/apt/sources.list



sudo apt update

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
sudo a2enmod userdir
sudo sed -i 's/php_admin_flag engine Off/php_admin_flag engine On/' /etc/apache2/mods-available/php8.2.conf

# Reiniciar o Apache
sudo service apache2 restart

echo '# Exportar o diretório NVM' >> /home/aluno/.bashrc
echo 'export NVM_DIR="$HOME/.config/nvm"' >> /home/aluno/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" ' >> /home/aluno/.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> /home/aluno/.bashrc
