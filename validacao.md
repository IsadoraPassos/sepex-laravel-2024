# Minicurso de Framework MVC Laravel 

Passo anterior: [views](https://github.com/IsadoraPassos/sepex-laravel-2024/blob/main/views.md)

## Validação

O Laravel oferece uma maneira poderosa e flexível de validar dados de entrada diretamente em controladores. A validação garante que os dados enviados pelo usuário estejam corretos e completos, evitando erros no sistema ou no banco de dados.

O Laravel suporta diversos tipos de validação, como:

- **Obrigatoriedade de campos**.
- **Formato específico** (e.g., e-mails, datas).
- **Tamanho mínimo e máximo de caracteres**.
- **Unicidade em campos** (e.g., o campo não pode ser repetido no banco).

### Validação de Dados no Controller
Vamos adicionar validação ao processo de **armazenamento** (ao criar uma planta) e **atualização** (ao editar uma planta). Isso será feito utilizando o método ``validate()`` diretamente no controlador.

1. Atualize o método **store()** e **update()** no ``PlantaController`` para incluir as validações necessárias.
```php
    // Armazenar uma nova planta
    public function store(Request $request)
    {
        $request->validate([
            'nome_cientifico' => 'required|unique:plantas,nome_cientifico|max:255',
            'nome_comum' => 'required|max:100',
            'bioma' => 'required',
            'descricao' => 'nullable|max:500',
        ], [
            'nome_cientifico.required' => 'O nome científico é obrigatório.',
            'nome_cientifico.unique' => 'Já existe uma planta com esse nome científico.',
            'nome_comum.required' => 'O nome comum é obrigatório.',
            'bioma.required' => 'O bioma é obrigatório.',
        ]);

        Planta::create($request->all());
        return redirect()->route('plantas.index');
    }

    // Atualizar uma planta existente
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'nome_cientifico' => 'required|string|max:255',
            'nome_comum' => 'required|string|max:255',
            'bioma' => 'required|string|max:255',
            'descricao' => 'nullable|string',
        ], [
            'nome_cientifico.required' => 'O nome científico é obrigatório.',
            'nome_comum.required' => 'O nome comum é obrigatório.',
            'bioma.required' => 'O bioma é obrigatório.',
        ]);
    
        $planta = Planta::findOrFail($id);
        $planta->update($validated);
    
        return redirect()->route('plantas.index')->with('success', 'Planta atualizada com sucesso!');
    }
```
2. Também podemos adicionar validações aos métodos que depedem do ``id`` vindo da rota:
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
        $request->validate([
            'nome_cientifico' => 'required|unique:plantas,nome_cientifico|max:255',
            'nome_comum' => 'required|max:100',
            'bioma' => 'required',
            'descricao' => 'nullable|max:500',
        ], [
            'nome_cientifico.required' => 'O nome científico é obrigatório.',
            'nome_cientifico.unique' => 'Já existe uma planta com esse nome científico.',
            'nome_comum.required' => 'O nome comum é obrigatório.',
            'bioma.required' => 'O bioma é obrigatório.',
        ]);

        Planta::create($request->all());
        return redirect()->route('plantas.index');
    }

    // Exibir os detalhes de uma planta
    public function show($id)
    {
        $planta = Planta::find($id);
        if(!$planta){
            return redirect()->route('plantas.index');
        }
            
        return view('plantas.show', compact('planta'));
    }

    // Exibir o formulário de edição de uma planta
    public function edit($id)
    {
        $planta = Planta::find($id);
        if(!$planta){
            return redirect()->route('plantas.index');
        }

        return view('plantas.edit', compact('planta'));
    }

    // Atualizar uma planta existente
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'nome_cientifico' => 'required|string|max:255',
            'nome_comum' => 'required|string|max:255',
            'bioma' => 'required|string|max:255',
            'descricao' => 'nullable|string',
        ], [
            'nome_cientifico.required' => 'O nome científico é obrigatório.',
            'nome_comum.required' => 'O nome comum é obrigatório.',
            'bioma.required' => 'O bioma é obrigatório.',
        ]);
    
        $planta = Planta::findOrFail($id);
        $planta->update($validated);
    
        return redirect()->route('plantas.index')->with('success', 'Planta atualizada com sucesso!');
    }

    // Excluir uma planta
    public function destroy($id)
    {
        $planta = Planta::find($id);
        if(!$planta){
            return redirect()->route('plantas.index');
        }

        $planta->delete();
        return redirect()->route('plantas.index');
    }
}
```

### Exibindo Mensagens de Erro
O Laravel gerencia automaticamente as mensagens de erro de validação e as armazena na sessão. Essas mensagens podem ser exibidas na view para fornecer feedback ao usuário quando ele preencher o formulário incorretamente.

Na view de criação de plantas (resources/views/plantas/create.blade.php), podemos exibir os erros de validação usando o seguinte código:
```php
@error('name')
    <div class="error">{{ $message }}</div>
@enderror
```
## Próximo passo
[css](https://github.com/IsadoraPassos/sepex-laravel-2024/blob/main/css.md)
