import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'render_cartao.dart';

Container RenderCardSantanderFront(cor,banco,codigo,validade,nome,financeira){
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
        RenderBanco(banco),
        RenderChip(),
        RenderCodigo(codigo),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RenderNome(validade,nome),
            RenderFinaceira(financeira),
          ],
        )
      ],
    ),
  );
}

Container RenderCardSantanderBack(cor){
  return Container(
    decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RenderAtendimento(),
        RenderTarja(Colors.black, 40.0),
        RenderValidacao(),
      ],
    ),
  );
}
