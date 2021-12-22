import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'views.dart';

Card RenderCardSus(BuildContext context){
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  return Card(
    elevation: 0.0,
    margin: EdgeInsets.only(left: 32.0,right: 32.0,top: 250,bottom: 250.0),
    color: Colors.white,
    child: FlipCard(
      key: _cardKey,
      flipOnTouch: true,
      direction: FlipDirection.VERTICAL,
      speed: 1000,
      onFlipDone: (status){
        print('status: $status');
      },
      front: RenderCardSusFront(Colors.green),
      back: RenderCardSusBack(Colors.green),
    ),
  );
}

