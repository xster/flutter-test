import 'package:flutter/material.dart';

Route checkoutRoute(List<String> bought) =>
    MaterialPageRoute(builder: (_) => Checkout(bought));

class Checkout extends StatelessWidget {

  Checkout(this.bought);

  final List<String> bought;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('结账')),
      body: Center(
        child: Container(
          height: 300.0,
          width: 300.0,
          padding: EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            color: Colors.deepOrange[100],
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(
            bought.join('\n'),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}