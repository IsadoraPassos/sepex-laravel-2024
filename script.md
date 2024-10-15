# Script para Configuração do Ambiente
## Rodando o script no terminal
1. Baixe o arquivo configurar_ambiente.sh
2. Abra o terminal na mesma pasta que contém o arquivo
3. Dê permissão de execução ao arquivo:
```bash
chmod +x configurar_ambiente.sh
```
4. Execute o script:
```bash
./configurar_ambiente.sh
```

## Instalar o composer
```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```
Global install:
```bash
sudo mv composer.phar /usr/local/bin/composer
```

Instalando as dependências do php:
```bash
sudo apt install php-xml
sudo apt-get install php-mbstring
sudo service apache2 restart
```
## Instalar o Node

```bash
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```
run the following to use nvm:
```bash
export NVM_DIR="/home/aluno/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

```bash
# download and install Node.js (you may need to restart the terminal)
nvm install 20

# verifies the right Node.js version is in the environment
node -v # should print `v20.18.0`

# verifies the right npm version is in the environment
npm -v # should print `10.8.2`
```
