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

# Reiniciar o Apache
sudo service apache2 restart

# Instalar o NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# Exportar o diretório NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Instalar a versão 20 do Node.js
nvm install 20

# Fim
echo "Configuração concluída!"
