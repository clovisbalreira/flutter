import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'views.dart';

Card RenderCardBanco(BuildContext context){
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  return Card(
    elevation: 0.0,
    margin: EdgeInsets.only(left: 32.0,right: 32.0,top: 250,bottom: 250.0),
    color: Colors.white,
    child: FlipCard(
      key: _cardKey,
      flipOnTouch: false,
      direction: FlipDirection.VERTICAL,
      speed: 1000,
      onFlipDone: (status){
        print('status: $status');
      },
      front: RenderCardSantanderFront(Colors.black12,'Santander','0000 0000 0000 0000','01/24','Clovis B Rodrigues','Master Card'),
      back: RenderCardSantanderBack(Colors.red),
    ),
  );
}

