import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'render_cartao.dart';

Container RenderCardVirtualFront(cor){
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RenderImagem('img/santanderbranco.png'),
            RenderImagem('img/wifi.png'),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top:10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RenderImagem('img/chip.png'),
              Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    RenderTexto('S', Colors.white, 80.0),
                    RenderTexto('X', Colors.black, 80.0)
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RenderImagem('img/mastercard.png'),
            ],
          ),
        ),
      ],
    ),
  );
}

Container RenderCardVirtualBack(cor){
  return Container(
    decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Container(
      margin: EdgeInsets.only(top: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RenderTarja(Colors.black,40.0),
          RenderValidacao(),
          //RenderInformacoes(),
        ],
      ),
    ),
  );
}
