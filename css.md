# Minicurso de Framework MVC Laravel 

Passo anterior: [validacao](https://github.com/IsadoraPassos/sepex-laravel-2024/blob/main/validacao.md) ou [views](https://github.com/IsadoraPassos/sepex-laravel-2024/blob/main/views.md) 

## Adicionando CSS à Aplicação

### Introdução ao Vite no Laravel
O Laravel utiliza o **Vite** para gerenciar e compilar assets (CSS, JavaScript, etc.) de forma eficiente. O Vite oferece uma experiência de desenvolvimento rápida com hot module replacement (HMR), permitindo que você veja as mudanças em tempo real sem precisar recarregar a página manualmente.

1. Instalação das Dependências
Antes de começar, certifique-se de que todas as dependências do projeto estão instaladas. No terminal, dentro do diretório do projeto, execute:
```bash
npm install
```
2. Compilando os Assets
Para compilar os assets e iniciar o servidor de desenvolvimento com HMR, execute:
```bash
npm run dev
```

### Editando o Arquivo CSS
Abra o arquivo ``resources/css/app.css`` e adicione alguns estilos básicos. Por exemplo:
```css
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    color: #343a40;
    margin: 0;
    padding: 0;
}

header {
    background-color: #28a745;
    padding: 20px;
    color: white;
}

nav a {
    color: white;
    margin-right: 15px;
    text-decoration: none;
}

nav a:hover {
    text-decoration: underline;
}

main {
    padding: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table, th, td {
    border: 1px solid #dee2e6;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: #e9ecef;
}

button {
    background-color: #dc3545;
    color: white;
    border: none;
    padding: 8px 12px;
    cursor: pointer;
    border-radius: 4px;
}

button:hover {
    background-color: #c82333;
}

.alert {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;
}

.alert-success {
    color: #155724;
    background-color: #d4edda;
    border-color: #c3e6cb;
}

.alert-danger {
    color: #721c24;
    background-color: #f8d7da;
    border-color: #f5c6cb;
}

.error {
    color: #dc3545;
    font-size: 0.9em;
}
```
### Atualizando as Views para Utilizar os Estilos
Vamos garantir que as views Blade estejam vinculadas aos estilos compilados.

1. Layout Principal (``layouts/app.blade.php``):

Certifique-se de que o arquivo Blade principal esteja incluindo os assets corretamente usando as diretivas do Vite.
```php
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Aplicação de Plantas')</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
```
``@vite:`` A diretiva @vite inclui os arquivos compilados pelo Vite. Ela deve estar dentro da tag ```<head>```

### Verificando as Alterações
Após adicionar os estilos, verifique se a aplicação está refletindo as mudanças:

1. Certifique-se de que o servidor de desenvolvimento do Laravel está rodando (``php artisan serve``)
2. No terminal, mantenha o processo do Vite rodando (``npm run dev``).
3. Acesse a aplicação em http://localhost:8000 e navegue pelas diferentes páginas (listagem, cadastro, edição) para ver as alterações de estilo aplicadas.

### Fazendo o Build da Aplicação
Depois que todas as funcionalidades e estilos da sua aplicação estiverem prontos, o próximo passo é fazer o build para produção. O comando npm run build é utilizado para gerar uma versão otimizada da aplicação, pronta para ser distribuída e executada em um ambiente de produção. Isso inclui otimizações como minificação de arquivos JavaScript e CSS.

1. Abrir o terminal na pasta do projeto: Certifique-se de que você está no diretório raiz do seu projeto (onde o arquivo package.json está localizado).

2. No terminal, execute o seguinte comando:
```bash
npm run build
```
