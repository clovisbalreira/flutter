import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cartao_virtual.dart';

class PageVirtual extends StatefulWidget {
  const PageVirtual({Key? key}) : super(key: key);

  @override
  _PageVirtualState createState() => _PageVirtualState();
}

class _PageVirtualState extends State<PageVirtual> {
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
                  child: RenderCardVirtual(context)
              ),
            ],
          ),
        ],
      ),
    );
  }
}



