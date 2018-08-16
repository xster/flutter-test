import 'package:flutter/material.dart';

void main() => runApp(
  Directionality(
    textDirection: TextDirection.ltr,
    child:
    Container(
      color: Colors.blue,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Text('A'),
          ),
          Text('B'),
        ],
      ),
    ),
  ),
);
