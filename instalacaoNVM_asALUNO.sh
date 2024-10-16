#!/bin/bash

# Liberando acesso ao usuario www-data do apache
mkdir -p ~/public_html
chmod 755 ~

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
