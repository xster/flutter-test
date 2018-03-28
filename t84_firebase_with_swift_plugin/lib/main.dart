import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
final table = FirebaseDatabase.instance.reference().child('test-1');

void main() async {
  if (await auth.currentUser() == null) {
    await auth.signInAnonymously();
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController textController = new TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Firebase test'),
        ),
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new FirebaseAnimatedList(
                query: table,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                  return new Text(snapshot.value['text']);
                },
              ),
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new TextField(
                    controller: textController,
                  ),
                ),
                new RaisedButton(
                  child: const Text('Send'),
                  onPressed: () {
                    table.push().set({
                      'text': textController.text,
                    });
                    textController.clear();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
