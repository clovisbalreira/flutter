import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//banco front
Container RenderImagem(img){
  return Container(
    child: Image.asset(img),
  );
}

Row RenderBanco(banco){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      RenderImagem('img/santandervermelho.png'),
      Text(
        banco,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.red,
        ),
      ),
    ],
  );
}

Container RenderChip(){
  return Container(
      child: Row(
        children: [
          RenderImagem('img/chip.png'),
        ],
      ),
  );
}

Container RenderCodigo(codigo){
  return Container(
    margin: EdgeInsets.only(left: 10.0, top: 10.0,bottom: 10.0),
    child:
    Text(codigo,
      style: TextStyle(
          color: Colors.black,
          fontSize: 20.0
      ),
    ),
  );
}

Container RenderFinaceira(financeira){
  return Container(
    margin: EdgeInsets.only(right: 10.0),
    child: Column(
      children: [
        RenderImagem('img/mastercard.png')
      ],
    ),
  );
}

Container RenderNome(validade,nome){
  return Container(
    child: Column(
      children: [
        Text(validade,
          style: TextStyle(fontSize: 20.0),
        ),
        Text(nome,
          style: TextStyle(
              fontSize: 20.0
          ),
        ),
      ],
    ),
  );
}

//render back
Text RenderTexto(texto,cor,tamanho){
  return Text(
      texto,
      style: TextStyle(
        color: cor,
        fontSize: tamanho,
      )
  );
}
Container RenderAtendimento(){
  return Container(
    margin: EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RenderTexto('Atendimento Santander', Colors.white , 5.0),
        RenderTexto('0000 0000', Colors.white , 7.0),
        RenderTexto('Região Metropolitana', Colors.white , 5.0),
        RenderTexto('0800 000 0000', Colors.white , 7.0),
        RenderTexto('Demais Localidades', Colors.white , 5.0),
      ],
    ),
  );
}

Container RenderTarja(cor,h){
  return Container(
    height: h,
    decoration: BoxDecoration(
      color: cor,
    ),
  );
}

Container RenderTarjaBorda(texto,cor,h,r,{w}){
  double rtl = r;
  double rbl = r;
  double rtr = 0.0;
  int direcao = -1;
  double mrg = 10.0;
  var alinhamento = MainAxisAlignment.start;
  if(w == null){
    rbl = 0.0;
    rtr = r;
    w = 350.0;
    direcao = 0;
    alinhamento = MainAxisAlignment.center;
    mrg = 0;
  }
  return Container(
    height: h,
    width: w,
    decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(rtl),
        bottomLeft: Radius.circular(rbl),
        topRight: Radius.circular(rtr),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: mrg),
      child: Column(
        mainAxisAlignment: alinhamento,
        children: [
          RotatedBox(
            quarterTurns: direcao,
            child: Text(texto,
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    ),
  );
}

Container RenderValidacao(){
  return Container(
    color: Colors.white,
    height: 35.0,
    margin: EdgeInsets.only(left: 10.0,bottom: 20.0,top: 20.0, right: 70.0),
    padding: EdgeInsets.only(right: 5.0),
    child: Container(
      alignment: Alignment.centerRight,
      child: Text('000',
      ),
    ),
  );
}

Container DadosPessoaisSus(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    margin: EdgeInsets.only(top: 5.0,left: 60.0,right: 60.0),
    padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 1.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RenderTexto('Clóvis Balreira Rodrigues',Colors.black,10.0),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RenderTexto('Data Nasc.: 06/08/1980',Colors.black,10.0),
              RenderTexto('Sexo:M', Colors.black, 10.0),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                RenderTexto('000 0000 0000 0000',Colors.black,18.0),
                RenderImagem('img/codigobarra.png')
              ],
            ),
        ),
      ],
    ),
  );
}

Container DadosSus(){
  return Container(
    margin: EdgeInsets.only(left: 50.0,top: 10.0),
    child: Column(
      children: [
        Center(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: RenderTexto('Disque Saude 136',Colors.white,7.0)
                  ),
                  RenderTexto('Este Cartão é de uso pessoal e intransferível.',Colors.white,8.0),
                  RenderTexto('Em caso de roubo ou perda,comunicar ad Disque-Saúde.',Colors.white,8.0),
                  RenderTexto('VÁLIDO EM TODO O TERRITÓRIO NACIONAL.',Colors.white,8.0),
                ],
              ),
              RenderImagemSus(),
            ],
          ),
        ),
      ],
    ),
  );
}

Container RenderImagemSus(){
  return Container(
    margin: EdgeInsets.only(right: 10.0),
    child: Column(
      children: [
        RenderImagem('img/sus.png')
      ],
    ),
  );
}
