# Minicurso de Framework MVC Laravel 

Passo anterior: [modelMigrationSeeder]()

## Operações CRUD com Eloquent

### Create (Inserir Registros no Banco de Dados)

A operação de **criação** de um novo registro pode ser feita de duas formas principais: usando o método ``create()`` ou criando uma instância do Model e usando ``save()``.

Exemplo de inserção de uma nova planta:

- Método 1: Utilizando o ``create()`` (certifique-se de que os campos estão definidos no ``$fillable``):
```php
Planta::create([
    'nome_cientifico' => 'Anadenanthera colubrina',
    'nome_comum' => 'Angico',
    'bioma' => 'Caatinga',
    'descricao' => 'Árvore típica de regiões semiáridas.'
]);
```
- Método 2: Criando uma instância do Model e salvando-a com ``save()``:
```php
$planta = new Planta();
$planta->nome_cientifico = 'Erythrina mulungu';
$planta->nome_comum = 'Mulungu';
$planta->bioma = 'Mata Atlântica';
$planta->descricao = 'Planta medicinal utilizada para tratamento de insônia.';
$planta->save();
```

### Read (Consultar Registros no Banco de Dados)

A operação de **leitura** de registros no Eloquent pode ser feita de várias maneiras usando métodos como ``all()``, ``find()``, ``where()`` e muito mais.

- Para listar todas as plantas:
```php
$plantas = Planta::all();
```
- Para encontrar uma planta específica pelo seu ``id``:
```php
$planta = Planta::find(1);
```
- Para filtrar registros com base em uma condição (plantas do bioma Cerrado):
```php
$plantas = Planta::where('bioma', 'Cerrado')->get();
```

### Update (Atualizar Registros no Banco de Dados)

Para **atualizar** um registro existente, primeiro você deve encontrá-lo e, em seguida, usar o método ``update()`` ou ajustar os atributos manualmente e salvar com ``save()``.

- Método 1: Usando o ``update()`` para atualizar o bioma de uma planta:
```php
$planta = Planta::find(1);
$planta->update([
    'bioma' => 'Cerrado'
]);
```
- Método 2: Atualizando e salvando manualmente:
```php
$planta = Planta::find(1);
$planta->bioma = 'Pantanal';
$planta->save();
```

### Delete (Deletar Registros do Banco de Dados)

Para **deletar** um registro, basta encontrá-lo e usar o método delete().

- Exemplo de exclusão de uma planta:
```php
$planta = Planta::find(1);
$planta->delete();
```
- Também é possível excluir múltiplos registros de uma vez com base em uma condição:
```php
Planta::where('bioma', 'Caatinga')->delete();
```

## Definir as Operações no Controller

Agora que temos o Model configurado e entendemos as operações CRUD, podemos integrá-las no Controller. Vamos ajustar o controller para manipular as plantas.

No arquivo ``PlantaController.php``, vamos adicionar as funcionalidades de CRUD para interagir com o Model ``Planta``.
```php
class PlantaController extends Controller
{
    //lista todas as plantas
    public function index()
    {
        $plantas = Planta::all();
        //dd($plantas);
        return view('plantas.index', compact('plantas'));
    }

    // Exibir o formulário de criação de uma nova planta
    public function create()
    {
        return view('plantas.create');
    }

    // Armazenar uma nova planta
    public function store(Request $request)
    {
        Planta::create($request->all());
        return redirect()->route('plantas.index');
    }

    // Exibir os detalhes de uma planta
    public function show($id)
    {
        $planta = Planta::find($id);    
        return view('plantas.show', compact('planta'));
    }

    // Exibir o formulário de edição de uma planta
    public function edit($id)
    {
        $planta = Planta::find($id);
        return view('plantas.edit', compact('planta'));
    }

    // Atualizar uma planta existente
    public function update(Request $request, $id)
    {
        $planta = Planta::findOrFail($id);
        $planta->update($validated);
        return redirect()->route('plantas.index')->with('success', 'Planta atualizada com sucesso!');
    }

    // Excluir uma planta
    public function destroy($id)
    {
        $planta = Planta::find($id);
        $planta->delete();
        return redirect()->route('plantas.index');
    }
}
```

## Rotas para CRUD
Para que as ações de CRUD no controller funcionem, vamos definir as rotas no arquivo ``routes/web.php``:
```php
Route::resource('plantas', PlantaController::class);
```
O comando ``Route::resource`` cria automaticamente todas as rotas RESTful para as ações do controller, como **index**, **store**, **update**, **destroy**, etc.

## Próximo passo
[views]()