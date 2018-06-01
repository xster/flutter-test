import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: CartList(),
    ));

List<String> items = <String>[
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

class CartList extends StatefulWidget {
  @override
  CartListState createState() => CartListState();
}

class CartListState extends State<CartList> {
  List<String> bought = <String>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: Text('Hot Reload'),
        ),
        body: ListView.builder(
          itemCount: bought.length,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  child: Icon(Icons.credit_card),
                ),
              ),
            ],
          ),
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
    return  Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.name),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => setState(
                          () {
                            if (quantity > 0) quantity--;
                          },
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(quantity.toString()),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => setState(() => quantity++),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
