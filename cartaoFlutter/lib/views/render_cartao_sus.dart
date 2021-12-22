import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'render_cartao.dart';

Container RenderCardSusFront(cor){
  return Container(
    decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Column(
      children: [
        Row(
          children: [
              RenderTarjaBorda('Cartão do Usuário',Colors.yellow,233.7,20.0,w: 40.0),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RenderImagemSus(),
                        Container(
                          margin: EdgeInsets.only(right: 30.0),
                          child: Column(
                            children: [
                              RenderTexto('Sistema', Colors.white, 10.0),
                              RenderTexto('Unico', Colors.white, 10.0),
                              RenderTexto('de Saúde', Colors.white, 10.0),
                            ],
                          ),
                        )
                      ],
                    ),
                    RenderTexto('Cartão Nacional de Saúde',Colors.white,15.0),
                  ],
                ),
            ),
            ],
          ),
      ]
    )
  );
}

Container RenderCardSusBack(cor){
  return Container(
    margin: EdgeInsets.only(top: 5.0),
    decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Column(
      children: [
        RenderTarjaBorda('Sistema Único de Saúde',Colors.yellow, 40.0,20.0),
        DadosPessoaisSus(),
        DadosSus(),
      ],
    ),
  );
}
