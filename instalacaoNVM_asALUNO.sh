#!/bin/bash

# Liberando acesso ao usuario www-data do apache
mkdir -p ~/public_html
chmod 755 ~

# Instalar o NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# Instalar a versão 20 do Node.js
nvm install 20

# Fim
echo "Configuração concluída!"
