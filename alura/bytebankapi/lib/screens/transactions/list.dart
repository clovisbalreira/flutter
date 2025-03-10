import 'package:bytebankbancodedados/componentes/centered_message.dart';
import 'package:flutter/material.dart';
import '../../componentes/progress.dart';
import '../../http/webClients/transactionwebClient.dart';
import '../../model/transaction.dart';

class TransactionsList extends StatelessWidget {
  final TransactionWebClient _webClient = TransactionWebClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<List<Transaction>>(
          future: _webClient.findAll(),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Transaction>? transaction = snapshot.data;
                if(snapshot.hasData) {
                  if (transaction!.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: Text(
                              transaction[index].value.toString(),
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              transaction[index].contact.accountNumber.toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: transaction?.length,
                    );
                  }
                  return CenteredMessage(
                      'No transactions found', icon: Icons.warning);

                  break;
                }
            }
            return CenteredMessage('Unknowk error', icon: Icons.warning);
          })
    );
  }
}
