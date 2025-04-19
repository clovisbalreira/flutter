import 'package:flutter/material.dart';
import 'package:techtaste/model/dish.dart';
import 'package:techtaste/ui/_corn/app_corns.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/ui/_corn/bag_provider.dart';

import '../_corn/widget/appBar.dart';

class DishScreen extends StatefulWidget {
  final Dish dish;

  const DishScreen({super.key, required this.dish});

  @override
  _DishScreenState createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  int _quantity = 0; // Variável para armazenar a quantidade

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: widget.dish.name),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 18,
            children: [
              Image.asset('assets/dishes/default.png'),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Text(
                      widget.dish.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
                    ),
                    Text('R\$${widget.dish.price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              Text(widget.dish.description),
              Row(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (_quantity > 0) _quantity--; // Diminui o valor, mas impede valores negativos
                        });
                      },
                      icon: Icon(Icons.arrow_drop_up,
                          color: Colors.black,
                        ),
                        iconSize: 25,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  Text(
                    '$_quantity', // Atualiza dinamicamente a quantidade
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Container(
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                    onPressed: () {
                      setState(() {
                        _quantity++; // Aumenta o valor
                      });
                    },
                    icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black
                      ),
                      iconSize: 25,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      for(var i = 0; i < _quantity; i++){
                        Provider.of<BagProvider>(context, listen: false).addAllDishes([widget.dish]);
                      }
                      _quantity = 0;
                    },
                    child: Text('Adicionar')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}