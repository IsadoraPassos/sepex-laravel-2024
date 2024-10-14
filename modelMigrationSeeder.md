# Minicurso de Framework MVC Laravel 

Passo anterior: [mvc]()

## Model

### Eloquent

O **Eloquent** ORM faz a ponte entre as tabelas do banco de dados e os modelos do Laravel, representando cada **tabela** como uma *classe* que permite realizar **operações** no banco de forma orientada a objetos. Para o nosso exemplo, a tabela plantas será representada pela classe Planta.

Cada instância dessa classe representará um registro na tabela, e os métodos disponíveis na classe permitirão realizar as operações de **inserir**, **consultar**, **atualizar** e **excluir** registros no banco.

### Criar um Model
Para cada tabela, o Eloquent recomenda a criação de um Model correspondente. No caso da tabela ``plantas``, precisamos criar um Model chamado ``Planta``. O nome do model segue a convenção de ser singular em relação ao nome da tabela.

1. Para criar o Model ``Planta``, execute o comando Artisan:
```bash
php artisan make:model Planta
```
Esse comando cria o arquivo ``Planta.php`` dentro da pasta ``app/Models``. Vamos agora configurar esse Model para interagir com a tabela plantas.

2. Abra o arquivo ``Planta.php`` e defina o Model da seguinte forma:
```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Planta extends Model
{
    use HasFactory;

    // Defina a tabela correspondente a esse Model
    protected $table = 'plantas';

    // Defina quais colunas podem ser preenchidas em massa
    protected $fillable = [
        'nome_cientifico',
        'nome_comum',
        'bioma',
        'descricao'
    ];
}
```
``$fillable``: Define quais colunas podem ser preenchidas diretamente através de operações em massa, como **create**() e **update**().

## Migration

As Migrações no Laravel são **scripts** PHP que definem como o banco de dados deve ser criado ou alterado. Cada migração contém instruções para criar, modificar ou excluir tabelas e colunas no banco de dados.

A principal vantagem das migrações é que elas permitem versionar as alterações do banco de dados, tornando o processo de atualização e compartilhamento do esquema mais fácil e controlado.

### Criar uma Migração

Para criar uma tabela no banco de dados, vamos usar o comando Artisan para gerar uma migração. Vamos criar uma tabela chamada ``plantas`` que armazenará as informações das plantas.

1. Execute o comando no terminal para gerar uma nova migração:
```bash
php artisan make:migration create_plantas_table
```
Esse comando cria um novo arquivo de migração na pasta ``database/migrations/``. O arquivo criado terá um nome baseado na data atual, seguido do nome ``create_plantas_table``.

### Definir a Estrutura da Tabela

Agora, vamos editar a migração para definir as colunas da tabela plantas.

1. Abra o arquivo da migração ``create_plantas_table``.php na pasta ``database/migrations/``.

2. Dentro da função ``up``, defina a estrutura da tabela plantas com as colunas desejadas:
```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlantasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('plantas', function (Blueprint $table) {
            $table->id();  // Cria uma chave primária automaticamente
            $table->string('nome_cientifico');  // Nome científico da planta
            $table->string('nome_comum');  // Nome popular da planta
            $table->string('bioma');  // Bioma onde a planta é encontrada
            $table->text('descricao')->nullable();  // Descrição opcional
            $table->timestamps();  // Cria colunas created_at e updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('plantas');
    }
}
```

### Executar as Migrações

Com a migração criada, agora é hora de aplicar essa migração ao banco de dados, ou seja, criar a tabela plantas.

Execute o comando abaixo no terminal para rodar todas as migrações pendentes e criar a tabela no banco de dados:
```bash
php artisan migrate
```
Esse comando executa todas as migrações que ainda não foram aplicadas e cria a tabela plantas com as colunas que definimos.

Se tudo estiver configurado corretamente, você verá uma mensagem indicando que as migrações foram aplicadas com sucesso. Para verificar se a tabela foi criada, abra seu sistema de gerenciamento de banco de dados e veja a estrutura da tabela plantas.

## Seeder

Para popular rapidamente o banco de dados com dados iniciais, o Laravel permite o uso de Seeders. Vamos criar um seeder para adicionar algumas plantas ao catálogo.

1. No terminal, execute o comando para gerar um seeder chamado ``PlantasTableSeeder``:
```bash
php artisan make:seeder PlantasTableSeeder
```
2. Agora, edite o arquivo ``PlantasTableSeeder.php`` localizado em ``database/seeders``:
```php
<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PlantasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('plantas')->insert([
            [
                'nome_cientifico' => 'Handroanthus albus',
                'nome_comum' => 'Ipê Amarelo',
                'bioma' => 'Cerrado',
                'descricao' => 'Árvore de grande porte, muito usada na arborização urbana.',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'nome_cientifico' => 'Schinus terebinthifolia',
                'nome_comum' => 'Aroeira',
                'bioma' => 'Mata Atlântica',
                'descricao' => 'Planta medicinal nativa do Brasil, conhecida por suas propriedades anti-inflamatórias.',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'nome_cientifico' => 'Erythrina falcata',
                'nome_comum' => 'Mulungu',
                'bioma' => 'Mata Atlântica',
                'descricao' => '',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'nome_cientifico' => 'Araucaria angustifolia',
                'nome_comum' => 'Pinheiro-do-Paraná',
                'bioma' => 'Mata de Araucária',
                'descricao' => '',
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}

```

3. Em seguida, registre o seeder no arquivo ``DatabaseSeeder.php`` para que ele seja executado junto com outros seeders:
```php
public function run()
{
    $this->call(PlantasTableSeeder::class);
}
```
4. Agora, execute o comando abaixo para popular a tabela plantas com os dados do seeder:
```bash
php artisan db:seed
```
Isso vai inserir as plantas no banco de dados. Você pode verificar os dados inseridos acessando a tabela plantas no sistema de gerenciamento de banco de dados.

## Próximo passo
[crud]()