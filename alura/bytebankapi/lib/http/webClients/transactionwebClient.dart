import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as client;
import '../webclient.dart';
import '../../model/transaction.dart';

class TransactionWebClient{

  Future<List<Transaction>> findAll() async {
    final Response response =
    await client.get(uri).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) =>
        Transaction.fromJson(json)).toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(uri, headers: {
      'Content-type': 'application/json',
      'password': '1000',
    }, body: transactionJson);
    return Transaction.fromJson(jsonDecode(response.body));
  }

}

