import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cartao_banco.dart';

class PageBanco extends StatefulWidget {
  const PageBanco({Key? key}) : super(key: key);

  @override
  _PageBancoState createState() => _PageBancoState();
}

class _PageBancoState extends State<PageBanco> {
  _renderBackground(){
    return Container(
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seus Cartões'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
          Column(
            children: [
              Expanded(
                  child: RenderCardBanco(context)
              ),
            ],
          ),
        ],
      ),
    );
  }
}



