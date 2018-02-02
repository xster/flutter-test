import 'package:flutter/material.dart';

void main() {
  runApp(
    new Container(
      color: Colors.white,
      child: new WidgetsApp(
        color: Colors.red,
        onGenerateRoute: (RouteSettings settings) {
          return new PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return new Text('Hello World');
            },
          );
        })));
}