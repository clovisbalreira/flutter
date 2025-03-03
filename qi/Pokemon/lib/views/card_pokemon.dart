import 'package:flutter/cupertino.dart';

import '../model/model.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:flip_card/flip_card.dart';

class CardPokemon extends StatefulWidget {
  final Pokemon? pokemon;
  final int? id;

  const CardPokemon({Key? key, this.pokemon, this.id}) : super(key: key);

  @override
  _CardPokemonState createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  @override
  void initState() {
    super.initState();
    //continuação....
  }

  //criando back flipcard
  _back(){
    return Container(
        width: 250.0,
        height: 250.0,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(150.0))
        ),
        child: Center(
            child: Text('${widget.pokemon!.name}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    )
                  ]
              ),
            )
        )
    );
  }

  //criando front flipcard
  _front(){
    return Container(
        width: 250.0,
        decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.all(Radius.circular(150.0))
        ),
        child: Image.network('${Constant.baseUrlImage}${widget.id}.png')
    );
  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.pokemon!.name}'),
      ),
      body: Center(
        child: Card(
          color: Colors.lightBlue[100],
          child: FlipCard(
            key: _cardKey,
            flipOnTouch: true,
            direction: FlipDirection.HORIZONTAL,
            speed: 1000,
            onFlipDone: (status) {
              print('status: $status');
            },
            front: _front(),
            back: _back(),
        )
    ),
      )
    );
  }
}