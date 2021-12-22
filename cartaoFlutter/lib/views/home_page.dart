import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'render_cartao.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seus Cartões'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red
                ),
                child: Text('Cartões',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                )
            ),
            ListTile(
              title: Text('Banco'),
              leading: Icon(
                Icons.card_giftcard,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/banco");
              },
            ),
            ListTile(
              title: Text('Banco Virtual'),
              leading: Icon(Icons.card_giftcard,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/virtual");
              },
            ),
            ListTile(
              title: Text('Sus'),
              leading: Icon(Icons.card_giftcard,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/sus");
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(80.0),
          child: Text('Esses são os seus cartões do banco, virtual do banco e do sus.',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
