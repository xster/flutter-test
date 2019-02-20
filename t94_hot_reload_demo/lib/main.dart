import 'package:flutter/material.dart';

import 'checkout.dart';

var items = <String>[
  '手表',
  '电视',
  '信封包',
  '运动鞋',
  '双肩包',
  '蓝牙耳机',
  '墨镜',
  '保温杯',
  '自行车',
  '耳环',
];

void main() => runApp(
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          textTheme: TextTheme(
            body1: TextStyle(fontSize: 20.0),
          ),
        ),
        home: CartList(),
      ),
    );

class CartList extends StatefulWidget {
  @override
  CartListState createState() => CartListState();
}

class CartListState extends State<CartList> {
  var bought = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Hot Reload'),
      ),
      body: ListView.builder(
        itemCount: bought.length,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        itemBuilder: (BuildContext context, int index) =>
            CartItem(bought[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () => setState(() => bought.add(items.removeAt(0))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Icon(Icons.credit_card),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem(this.name);
  final String name;
  @override
  CartItemState createState() => new CartItemState();
}

class CartItemState extends State<CartItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(widget.name),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () { 
                if (quantity > 0) setState(() => quantity--);
               },
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(quantity.toString()),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() => quantity++),
            ),
          ],
        ),
      ],
    );
  }
}
