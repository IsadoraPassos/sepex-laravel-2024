# Minicurso de Framework MVC Laravel 

Laravel é o framework PHP open-source mais popular para o desenvolvimento
de sistemas web seguindo o padrão MVC (model, view, controller). Possui uma estrutura
organizada e simples, segundo um padrão modularizado com gerenciamento de
dependências. Possui suporte para uma série de utilitários de produtividade, tais como
recursos para bancos de dados relacionais e ferramentas de testes. Nesta oficina,
apresentaremos as principais facilidades do framework através de uma abordagem prática
orientada a projeto.

## Configurações Necessárias Para rodar o Laravel 
**Não é necessário para quem usar as maquinas virtuais**

Confira as versões mínimas recomendadas:

- **PHP** (versão 8.1 ou superior)
  - Laravel requer PHP 8.1 ou superior. Instale o PHP via [site oficial](https://www.php.net/downloads) ou por um gerenciador de pacotes.
  
- **Composer** (gerenciador de dependências para PHP)
  - Composer é usado para gerenciar as dependências do Laravel. Baixe e instale via [site oficial](https://getcomposer.org/).

- **MySQL** (banco de dados)
  - Laravel utiliza MySQL como padrão. Certifique-se de que o MySQL esteja configurado e rodando.

- **Git** (versão 2.x ou superior)
  - Para clonar o projeto do GitHub. Baixe e instale via [site oficial](https://git-scm.com/downloads).

- **Node.js** (versão 16.x ou superior)
  - Laravel utiliza Node.js para compilar assets (JavaScript e CSS). Instale via [site oficial](https://nodejs.org/en/).

## Introdução e Configuração

### 1. Criar uma Nova Aplicação Laravel

1. No terminal, navegue até o diretório onde você deseja criar a aplicação. 
2. Execute o comando abaixo para criar uma nova aplicação Laravel chamada "catalogo-plantas":
```bash
composer create-project laravel/laravel catalogo-plantas
```
### 2. Estrutura de Diretórios Principais

- **`app/`**: Contém o código principal da aplicação, incluindo Models, Controllers, e outros serviços.
- **`resources/`**: Armazena as Views (usando Blade), arquivos de linguagem, e ativos front-end como CSS e JavaScript.
- **`routes/`**: Define todas as rotas da aplicação, divididas em arquivos como `web.php` para rotas web e `api.php` para APIs.
- **`database/`**: Inclui migrações, factories e seeders para gerenciar o banco de dados.
- **`config/`**: Configurações diversas da aplicação.

### 3. Configuração do Ambiente de Desenvolvimento

O Laravel vem com um arquivo `.env.example` que deve ser copiado e renomeado para `.env`. Este arquivo contém as variáveis de ambiente que o Laravel usará para se conectar ao banco de dados e outros serviços.

1. Renomeie o arquivo `.env.example` para `.env` com o comando:
```bash
cp .env.example .env
```
2. Em seguida, gere uma chave de aplicação que o Laravel usará para criptografar dados. Isso pode ser feito com o comando:
```bash
php artisan key:generate
```

### 4. Iniciar o Servidor de Desenvolvimento

Após a configuração, inicie o servidor de desenvolvimento integrado do Laravel com o comando:
```bash
php artisan serve
```
Isso fará com que o servidor Laravel seja iniciado localmente, geralmente acessível em http://localhost:8000

## Links úteis
[Documentação do Laravel](https://laravel.com/docs/11.x/)


Cursos gratuitos:
- [Laravel Framework for Beginners - Alison](https://alison.com/course/laravel-framework-for-beginners) - **em inglês**
- [Curso gratuito Laravel 9 - Workover](https://workover.com.br/cursos/749)
- [Laravel para iniciantes - EAD Education](https://ead.education/course/laravel-para-iniciantes/)
- [Laravel - Jornada do Dev](https://jornadadodev.com.br/cursos/back-end/laravel)

## Próximo passo
[MVC]()