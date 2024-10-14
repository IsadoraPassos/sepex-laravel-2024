# Minicurso de Framework MVC Laravel 

Passo anterior: [configurações iniciais]()


## O que é MVC?

O padrão MVC divide a aplicação em três partes principais:

- **Model (Modelo):** Representa os dados e a lógica do negócio. No Laravel, o Model é uma classe que mapeia uma tabela do banco de dados.
- **View (Visão):** Trata da apresentação, ou seja, a interface com a qual o usuário interage. No Laravel, as Views são geralmente arquivos Blade (templates) usados para renderizar páginas HTML.
- **Controller (Controlador):** Contém a lógica que intermedia a comunicação entre o Model e a View. No Laravel, o Controller processa as requisições HTTP, interage com os Models, e retorna uma View ou uma resposta.

## Implementação da Estrutura MVC no Laravel

### 1. Criação da Primeira Rota

No Laravel, as rotas definem como as URLs do aplicativo mapeiam para as ações nos controladores. Vamos começar criando uma rota simples que exibe uma lista de plantas.

1. Abra o arquivo `routes/web.php`, que é onde as rotas são definidas para a web (HTTP GET, POST, etc.). 
Dentro do arquivo, adicione uma rota simples que retorna uma string:

  ```php
  Route::get('/', function () {
    return 'Bem-vindo ao Catálogo de Plantas Nativas';
  });
  ```

Acesse a URL http://localhost:8000 no navegador para verificar se a rota está funcionando. Você verá a mensagem "Bem-vindo ao Catálogo de Plantas Nativas" sendo exibida.

### 2. Criar um Controlador

O próximo passo é criar um controlador que vai manipular as requisições. Para isso, utilizamos o comando Artisan para gerar automaticamente o arquivo do controlador.

1. No terminal, execute o seguinte comando para criar um controlador chamado `PlantaController`:
```bash
php artisan make:controller PlantaController
```
Esse comando cria um arquivo `PlantaController.php` dentro do diretório `app/Http/Controllers/`.

### 3. Adicionar uma Ação no Controlador

Agora vamos adicionar uma ação no controlador ``PlantaController`` para exibir uma lista de plantas.

1. Abra o arquivo ``app/Http/Controllers/PlantaController.php`` e adicione o método ``index`` para retornar uma mensagem inicial:
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PlantaController extends Controller
{
    public function index()
    {
        return 'Aqui será exibida a lista de plantas nativas';
    }
}
```

Depois, edite a rota ``web.php`` para que ela aponte para o método ``index`` do ``PlantaController``:
```php
Route::get('/', [PlantaController::class, 'index']);
```
Agora, quando você acessar http://localhost:8000, a mensagem "Aqui será exibida a lista de plantas nativas" será exibida. Isso demonstra como as rotas estão mapeadas para os controladores no Laravel.

### 4. Criar uma View

Agora que temos uma rota e um controlador, vamos adicionar uma **View** para exibir a lista de plantas de forma mais estruturada.

1. Crie um arquivo Blade chamado ``index.blade.php`` dentro de ``resources/views/``:
```php
<!-- resources/views/index.blade.php -->

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Plantas Nativas</title>
</head>
<body>
    <h1>Catálogo de Plantas Nativas do Brasil</h1>
    <p>Aqui será exibida a lista de plantas.</p>
</body>
</html>

```
2. Agora, modifique o método ``index`` do ``PlantaController`` para retornar essa View:
```php
public function index()
{
    return view('index');
}
```
Quando você acessar a página novamente, verá a estrutura HTML com o título e a mensagem que colocamos na View. Isso demonstra como o Laravel utiliza o Blade para renderizar o conteúdo dinâmico nas páginas.

### 5. Explicação do Fluxo MVC

Neste ponto, o fluxo básico do MVC no Laravel já está em ação:

1. O usuário acessa a rota ``/`` no navegador.
2. A rota está definida em ``routes/web.php`` e mapeia para o método ``index`` do ``PlantaController``.
3. O controlador ``PlantaController`` processa a requisição e retorna uma **View**.
4. A View ``index.blade.php`` é renderizada e enviada como resposta ao navegador.

### 6. Passo Adicional: Passando Dados do Controller para a View
Agora, para tornar isso mais dinâmico, vamos simular a exibição de uma lista de plantas.

1. Modifique o método ``index`` do ``PlantaController`` para passar uma lista de plantas (um array simples por enquanto) para a View:
```php
public function index()
{
    $plantas = [
        ['nome_comum' => 'Ipê Amarelo', 'bioma' => 'Cerrado'],
        ['nome_comum' => 'Aroeira', 'bioma' => 'Mata Atlântica'],
        ['nome_comum' => 'Castanheira', 'bioma' => 'Amazônia']
    ];

    return view('index', ['plantas' => $plantas]);
}
```
2. Agora, edite o arquivo ``index.blade.php`` para exibir a lista de plantas:
```php
<h1>Catálogo de Plantas Nativas do Brasil</h1>

<ul>
    @foreach ($plantas as $planta)
        <li>{{ $planta['nome_comum'] }} - Bioma: {{ $planta['bioma'] }}</li>
    @endforeach
</ul>
```
Quando acessar a página, verá uma lista simples de plantas sendo exibida, mostrando como os dados podem ser passados do controlador para a View.

### 7. Models e Eloquent ORM

- **Models**: Representam as tabelas do banco de dados e são responsáveis pela interação com os dados. Cada model geralmente corresponde a uma tabela específica.

- **Eloquent ORM**: É o Object-Relational Mapper do Laravel que facilita operações de banco de dados, permitindo interações intuitivas como criar, ler, atualizar e deletar registros sem escrever SQL diretamente.


## Próximo passo
[Model, migration e seeder]()
