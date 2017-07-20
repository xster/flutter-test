import 'package:flutter/material.dart';

void main() {
  runApp(new TestWidget());
  //runApp(new Center(child: new Text('aཀ中')));
}

class TestWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        'o｟｠｡｢｣､･ｦｧ⟘⟙⟚⤁⤅⦩⦪⦫⦬⦭⠶⠷⠸⠹⠺▃▄▅▆▇≔≕≖≗≘☌☍☎♈♉♊♋☏ᎠᎡᎢᎣᎤᎥᎦႠႡႢႣ༁༂༃ธนบநனபɷɸডঢণতɹɺeuՍՎڈډڊڋڌՐاאཀ中한ひカ漢मा😦👍😂😙😱👨👩🙆💇🐰🚑🤹🤞🦇📣',
        style: new TextStyle(fontFamily: 'Serif', fontSize: 30.0, letterSpacing: 12.0)
      )
    );
  }

}
