import 'package:flutter/material.dart';

import '../../componentes/editor.dart';
import '../../models/transferencia.dart';

const _titulo = 'Criando Transferencia';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }

}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_titulo), backgroundColor: Theme.of(context).primaryColor,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controlador: _controladorCampoNumeroConta, rotulo: _rotuloCampoNumeroConta, dica: _dicaCampoNumeroConta),
              Editor(controlador: _controladorCampoValor, rotulo: _rotuloCampoValor, dica: _dicaCampoValor, icone:  Icons.monetization_on),
              ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textoBotaoConfirmar),
              )
            ],
          ),
        )
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
