import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cartao_sus.dart';

class PageSus extends StatefulWidget {
  const PageSus({Key? key}) : super(key: key);

  @override
  _PageSusState createState() => _PageSusState();
}

class _PageSusState extends State<PageSus> {
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
                  child: RenderCardSus(context)
              ),
            ],
          ),
        ],
      ),
    );
  }
}



