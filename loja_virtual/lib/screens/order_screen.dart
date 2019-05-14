import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {

  final String orderID;

  OrderScreen(this.orderID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Pedido Relizado"),
          centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check,
            color: Theme.of(context).primaryColor,
            size: 80.0,
            ),
            Text("Pedido realizado com sucesso!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Text("Código do pedido: $orderID",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
