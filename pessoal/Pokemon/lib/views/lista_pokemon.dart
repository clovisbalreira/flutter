import 'package:flutter/cupertino.dart';

import '../model/model.dart';
import '../service/service.dart';
import '../views/views.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../function/function.dart';

class ListaPokemon extends StatefulWidget {
  const ListaPokemon({Key? key}) : super(key: key);

  @override
  State<ListaPokemon> createState() => _ListaPokemon();
}

class _ListaPokemon extends State<ListaPokemon> {
  List<Pokemon?>? _pokemonsList;
  bool _progress = false;

  int _count = 0;
  int _page = 1;

  //criando icone
  _rowIcon() {
    return Image.network(
        'https://cdn.discordapp.com/attachments/577900277357871106/877569042477629480/snorlax.png');
  }

  //criando progresso
  _rowProgress() {
    return _progress ? const CircularProgressIndicator() : Container();
  }

  //criando titulo
  _title(Pokemon? pokemon) {
    return Text(pokemon!.name.toString());
  }

  //criando lista do pokemons
  _rowListPokemon() {
    if (_pokemonsList == null) {
      return const Text('Sem pokemon', style: TextStyle(fontSize: 20.0));
    }
    return ListView.builder(
       itemCount: _pokemonsList!.length,

       itemBuilder: (context,index){
       final pokemon = _pokemonsList!.elementAt(index);
         return ListTile(
           title: _title(pokemon),
           leading: Image.network('${Constant.baseUrlImage}${index+1}.png'),
           onTap: () {
             Navigator.push(
                 context,
                 MaterialPageRoute(builder: (BuildContext context) => CardPokemon(
                   pokemon: pokemon,
                   id: index + 1,
                 )
               ));
           },
         );
        });
  }

  //criando o controle as paginas
  _rowControls(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _count > 0
          ? TextButton.icon(
              onPressed: () => _previous(context),
              label: Text('Anterior',
              style: TextStyle(
                  color: Colors.black
                ),
              ),
              icon: Icon(Icons.arrow_back_outlined,color: Colors.black))
          : Container(),
      TextButton.icon(
          onPressed: () => _next(context),
          label: Text('Próximo',
            style: TextStyle(
                color: Colors.black
            ),
          ),
          icon: Icon(Icons.arrow_forward_outlined,color: Colors.black)),
    ]);
  }

  //criado numero de pagina
  _rowPage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text('Página ${_page.toString()}',
          style: const TextStyle(fontSize: 30.0
          )
      ),
    );
  }

  //criando corpo da pagina
  _body(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        _rowPage(),
        Container(
          height: 400,
          child: _rowListPokemon(),
        ),
        _rowControls(context),
        _rowProgress()
      ],
    );
  }

  //criando o reset da pagina
  _fetchPokemon(BuildContext context) async {
    _count = 0;
    _page = 1;

    final pokemonService = PokemonService();

    setState(() {
      _progress = true;
    });

    sendSnackBar(context, 'Aguarde, baixando pokemons');

    _pokemonsList = await pokemonService.fetchPokemon();

    print('lista mapeada: ${_pokemonsList.toString()}');

    setState(() {
      _progress = false;
    });
  }

  //criando avanço da pagina
  _next(BuildContext context) async {
    _count = _count + 20;
    _page++; //_page = _page + 1;

    setState(() {
      _progress = true;
    });

    final pokemonService = PokemonService();
    _pokemonsList =
        await pokemonService.fetchNextPreviousPokemon(offset: _count);

    print('lista mapeada: ${_pokemonsList.toString()}');

    setState(() {
      _progress = false;
    });
  }

  //criando volta de pagina
  _previous(BuildContext context) async {
    _count = _count - 20;
    _page--; //_page = _page - 1;

    setState(() {
      _progress = true;
    });

    final pokemonService = PokemonService();
    _pokemonsList =
        await pokemonService.fetchNextPreviousPokemon(offset: _count);

    sendSnackBar(context, 'Aguarde, baixando pokemons');

    _pokemonsList = await pokemonService.fetchPokemon();

    print('lista mapeada: ${_pokemonsList.toString()}');

    setState(() {
      _progress = false;
    });
  }

  //criando botão atualizar
  _botaoAtualizar(){
    return FloatingActionButton(
        onPressed: () {
          _fetchPokemon(context);
        },
        tooltip: 'Increment',
        backgroundColor: Colors.yellow,
        child: Text('Atualizar',
          style: TextStyle(
              fontSize: 10.0,
              color: Colors.black
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Lista Pokemon'),
      ),
      body: _body(context),
      floatingActionButton: _botaoAtualizar()
    );
  }

}
