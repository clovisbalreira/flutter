import 'package:flutter/material.dart';
import '../../modelos/receitas.dart';

class Detalhes extends StatelessWidget{

  final Receitas receitas;

  Detalhes({Key? key, required this.receitas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _construirDetalhes();
  }

  Widget _construirDetalhes(){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirImagemDetalhes(receitas.foto),
          _construirTituloDetalhes(receitas.titulo),
          _construirLinhaIconesDetalhes('${receitas.porcoes} porções', receitas.tempoPreparo),
          _ConstruirSubtituloDetalhes('Ingrediente'),
          _construirTextoDetalhes(receitas.ingredientes),
          _ConstruirSubtituloDetalhes('Modo Preparo'),
          _construirTextoDetalhes(receitas.modoPreparo)
        ],
      ),
      appBar: _construirAppBar(),
    );
  }
  
  Widget _construirImagemDetalhes(imagem){
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(titulo){
    return Center(
      child: Text(titulo, style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30
      ))
    );
  }

  Widget _construirLinhaIconesDetalhes(rendimento, tempo_preparo) {
    return Row(
      children: <Widget>[
        _construirColunaIconesDetalhes(Icons.restaurant, rendimento),
        _construirColunaIconesDetalhes(Icons.timer, tempo_preparo)
      ],
    );
  }

  Widget _construirColunaIconesDetalhes(icone, texto) {
    return Expanded(
        child: Column(
          children: <Widget>[
            Icon(icone, color: Colors.deepOrange,),
            Text(texto, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold ))
          ],
        )
    );

  }

  Widget _ConstruirSubtituloDetalhes(subtitulo){
    return Center(
        child: Text(subtitulo, style: TextStyle(
        fontSize: 20
        ),
      )
    );
  }

  Widget _construirTextoDetalhes(texto){
    return Container(
      padding: EdgeInsets.all((16)),
        child: Text(texto)
    );
  }

  PreferredSizeWidget _construirAppBar() {
    return AppBar(
        title: Text('Cozinhando em Casa'),
        backgroundColor: Colors.deepOrange,
    );
  }
}