# Minicurso de Framework MVC Laravel 

Passo anterior: [crud]()

## O que é Blade Templating?
Blade é o sistema de templates do Laravel, que permite escrever HTML combinado com PHP de uma maneira clara e concisa. Com Blade, é possível criar layouts reutilizáveis, injetar dados nas views e criar componentes dinâmicos com facilidade.

Blade é diferente de outros motores de template, pois não impede o uso de PHP puro, se necessário. Ele também oferece sintaxes simplificadas para estruturas comuns, como laços e condicionais.

**Vantagens do Blade:**
- **Herança de layout**: Facilita a criação de um layout base para o site.
- **Componentes reutilizáveis**: Facilita a manutenção e a consistência visual.
- **Sintaxe simples e amigável**: Mais conciso que o PHP puro.

### Criando um Layout Principal

Um dos primeiros passos ao utilizar Blade é criar um layout principal que será compartilhado entre as páginas. Vamos criar um arquivo de layout que contenha a estrutura HTML básica do site.

1. Crie o arquivo ``layouts/app.blade.php`` dentro da pasta ``resources/views``:
```php
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Aplicação de Plantas')</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
</head>
<body>
    <header>
        <nav>
            <a href="{{ route('plantas.index') }}">Início</a>
            <a href="{{ route('plantas.create') }}">Cadastrar Planta</a>
        </nav>
    </header>

    <main>
        @yield('content')
    </main>

    <footer>
        <p>&copy; {{ date('Y') }} Biomas do Brasil</p>
    </footer>
</body>
</html>
```
Neste layout, usamos duas diretivas Blade importantes:

- ``@yield('title')``: Especifica onde o título da página será inserido pelas views que herdam este layout.
- ``@yield('content'):`` Define onde o conteúdo principal da página será inserido.


As rotas nos links do menu estão usando o helper ``route()``, que gera URLs para as rotas nomeadas.

### Criando Views que Herdam o Layout
Agora que temos um layout base, podemos criar as views para listar e cadastrar plantas. Essas views herdarão o layout app.blade.php usando a diretiva @extends.

1. View para Listagem de Plantas (index.blade.php):
```php
@extends('layouts.app')

@section('title', 'Listagem de Plantas')

@section('content')
    <h1>Plantas Cadastradas</h1>

    <table>
        <thead>
            <tr>
                <th>Nome Científico</th>
                <th>Nome Comum</th>
                <th>Bioma</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($plantas as $planta)
                <tr>
                    <td>{{ $planta->nome_cientifico }}</td>
                    <td>{{ $planta->nome_comum }}</td>
                    <td>{{ $planta->bioma }}</td>
                    <td>
                        <a href="{{ route('plantas.edit', $planta->id) }}">Editar</a>
                        <form action="{{ route('plantas.destroy', $planta->id) }}" method="POST" style="display: inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit">Excluir</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
```

2. View para Cadastro de Plantas (create.blade.php):
```php
@extends('layouts.app')

@section('title', 'Cadastrar Planta')

@section('content')
    <h1>Cadastrar Nova Planta</h1>

    <form action="{{ route('plantas.store') }}" method="POST">
        @csrf

        <div>
            <label for="nome_cientifico">Nome Científico</label>
            <input type="text" id="nome_cientifico" name="nome_cientifico" value="{{ old('nome_cientifico') }}">
            @error('nome_cientifico')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>

        <div>
            <label for="nome_comum">Nome Comum</label>
            <input type="text" id="nome_comum" name="nome_comum" value="{{ old('nome_comum') }}">
            @error('nome_comum')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>

        <div>
            <label for="bioma">Bioma</label>
            <input type="text" id="bioma" name="bioma" value="{{ old('bioma') }}">
            @error('bioma')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>

        <div>
            <label for="descricao">Descrição (opcional)</label>
            <textarea id="descricao" name="descricao">{{ old('descricao') }}</textarea>
        </div>

        <button type="submit">Cadastrar</button>
    </form>
@endsection
```

3. View para Edição de Plantas (edit.blade.php):
```php
@extends('layouts.app')

@section('title', 'Editar Planta')

@section('content')
    <h1>Editar Planta: {{ $planta->nome_comum }}</h1>

    <form action="{{ route('plantas.update', $planta->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div>
            <label for="nome_cientifico">Nome Científico</label>
            <input type="text" id="nome_cientifico" name="nome_cientifico" value="{{ old('nome_cientifico', $planta->nome_cientifico) }}">
            @error('nome_cientifico')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>

        <div>
            <label for="nome_comum">Nome Comum</label>
            <input type="text" id="nome_comum" name="nome_comum" value="{{ old('nome_comum', $planta->nome_comum) }}">
            @error('nome_comum')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>

        <div>
            <label for="bioma">Bioma</label>
            <input type="text" id="bioma" name="bioma" value="{{ old('bioma', $planta->bioma) }}">
            @error('bioma')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>

        <div>
            <label for="descricao">Descrição (opcional)</label>
            <textarea id="descricao" name="descricao">{{ old('descricao', $planta->descricao) }}</textarea>
        </div>

        <button type="submit">Atualizar Planta</button>
    </form>
@endsection
```
4. View para Exibição de Detalhes da Planta (show.blade.php)
```php
@extends('layouts.app')

@section('title', 'Detalhes da Planta')

@section('content')
    <h1>Detalhes da Planta: {{ $planta->nome_comum }}</h1>

    <div>
        <strong>Nome Científico:</strong>
        <p>{{ $planta->nome_cientifico }}</p>
    </div>

    <div>
        <strong>Nome Comum:</strong>
        <p>{{ $planta->nome_comum }}</p>
    </div>

    <div>
        <strong>Bioma:</strong>
        <p>{{ $planta->bioma }}</p>
    </div>

    <div>
        <strong>Descrição:</strong>
        <p>{{ $planta->descricao ? $planta->descricao : 'Nenhuma descrição disponível.' }}</p>
    </div>

    <div>
        <a href="{{ route('plantas.edit', $planta->id) }}">Editar</a>

        <form action="{{ route('plantas.destroy', $planta->id) }}" method="POST" style="display: inline;">
            @csrf
            @method('DELETE')
            <button type="submit">Excluir</button>
        </form>
    </div>
@endsection
```

## Próximo passo
[validação]()