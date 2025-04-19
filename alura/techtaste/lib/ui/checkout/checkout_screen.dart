import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/ui/_corn/app_corns.dart';
import 'package:techtaste/ui/_corn/bag_provider.dart';
import '../../model/dish.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    num totalPrice = bagProvider.getMapByAmount().isNotEmpty
        ? bagProvider.getMapByAmount().entries
        .map((entry) => entry.key.price * entry.value)
        .reduce((value, element) => value + element)
        : 0.0;
    bool isBagEmpty = bagProvider.getMapByAmount().isEmpty;
    num frete = totalPrice >= 100 ? 0 : 10;
    num total = frete + totalPrice;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sacola'),
        actions: [
          TextButton(onPressed: (){
            bagProvider.clearBag();
          }, child: Text('Limpar', style: TextStyle(color: AppColors.mainColor),))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: isBagEmpty
            ? Center(
              child: Text(
                'Seu Carrinho está vazio!'
              ),
          )
          : SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                    child: Text('Pedidos', style: TextStyle(color: AppColors.mainColor),)
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                List.generate(
                  bagProvider.getMapByAmount().keys.length, (index) {
                    Dish dish = bagProvider.getMapByAmount().keys.toList()[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          Container(
                            padding: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: AppColors.lightBackgroundColor,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 20,
                                  children: [
                                    Image.asset('assets/dishes/default.png',
                                        width: 200
                                    ),
                                    Column(
                                      children: [
                                        Text(dish.name),
                                        Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: IconButton(onPressed: (){
                                          bagProvider.removeDish(dish);
                                        }, icon: Icon(
                                            Icons.arrow_drop_up,
                                            color: Colors.black,
                                          ),
                                          iconSize: 20,
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    Text(bagProvider.getMapByAmount()[dish].toString(), style: TextStyle(fontSize: 18),),
                                    Container(
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(onPressed: (){
                                        bagProvider.addAllDishes([dish]);
                                      }, icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black
                                        ),
                                        iconSize: 20,
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              //Padding(
              //  padding: const EdgeInsets.all(8.0),
              //  child: Align(
              //      alignment: Alignment.centerLeft,
              //      child: Text('Pagamento', style: TextStyle(color: AppColors.mainColor),)
              //  ),
              //),
              //Column(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              //  children: [
              //    ]
              //),
              //Container(
              //  padding: EdgeInsets.only(right: 10),
              //  decoration: BoxDecoration(
              //      color: AppColors.lightBackgroundColor,
              //      borderRadius: BorderRadius.circular(15)
              //  ),
              //  child: Padding(
              //    padding: const EdgeInsets.all(16.0),
              //    child: Row(
              //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //        children: [
              //          Image.asset('assets/others/visa.png', width: 50,),
              //          Text('Cartão'),
              //          Container(
              //            width: 25,
              //            decoration: BoxDecoration(
              //              color: AppColors.mainColor,
              //              shape: BoxShape.circle,
              //            ),
              //            child: Center(
              //              child: IconButton(onPressed: (){
              //              }, icon: Icon(
              //                Icons.arrow_right,
              //                color: Colors.black,
              //              ),
              //                iconSize: 20,
              //                padding: EdgeInsets.zero,
              //              ),
              //            ),
              //          ),
              //        ]
              //    ),
              //  ),
              //),
              //Padding(
              //  padding: const EdgeInsets.all(8.0),
              //  child: Align(
              //      alignment: Alignment.centerLeft,
              //      child: Text('Carregar Endereço', style: TextStyle(color: AppColors.mainColor),)
              //  ),
              // ),
              //Container(
              //  padding: EdgeInsets.only(right: 10),
              //  decoration: BoxDecoration(
              //      color: AppColors.lightBackgroundColor,
              //      borderRadius: BorderRadius.circular(15)
              //  ),
              //  child: Padding(
              //    padding: const EdgeInsets.all(16.0),
              //    child: Row(
              //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //        children: [
              //          Icon(Icons.account_balance),
              //          Text('Rua'),
              //          Container(
              //            width: 25,
              //            decoration: BoxDecoration(
              //              color: AppColors.mainColor,
              //              shape: BoxShape.circle,
              //            ),
              //            child: Center(
              //              child: IconButton(onPressed: (){
              //              }, icon: Icon(
              //               Icons.arrow_right,
              //               color: Colors.black,
              //              ),
              //                iconSize: 20,
              //                padding: EdgeInsets.zero,
              //              ),
              //            ),
              //          ),
              //        ]
              //    ),
              //  ),
              //),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Confirmar', style: TextStyle(color: AppColors.mainColor),)
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: AppColors.lightBackgroundColor,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pedido:"),
                            Text("R\$ ${totalPrice.toStringAsFixed(2)}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${frete == 0 ? 'Frete Grátis' : "Frete"}"),
                            Text("R\$ ${frete.toStringAsFixed(2)}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total:"),
                            Text("R\$ ${total.toStringAsFixed(2)}"),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: (){
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Icon(Icons.account_balance_wallet_rounded, color: Colors.black,),
                                    Text('Pedir', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                )
                            ),
                          ),
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
         ),
        ),
      ),
    );
  }
}
