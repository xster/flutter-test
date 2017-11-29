import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute<Null>(
              settings: new RouteSettings(),
              builder: (BuildContext context) {
                return new SignInComponent();
              },
            ),
          );
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// Presented after tapping the floating action button
class SignInComponent extends StatefulWidget {
  _SignInComponentState createState() => new _SignInComponentState();
}

class _SignInComponentState extends State<SignInComponent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  bool _autovalidate = false;
  bool _shouldHideKeyboard = false;

  Map<String, TextEditingController> _controllers = {};

  Map<String, FocusNode> _focusNodes = {};

  @override
  Widget build(BuildContext context) {
    double height =
    Theme.of(context).platform == TargetPlatform.iOS ? 76.0 : 90.0;
    double topPadding = MediaQuery.of(context).padding.top;
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new PreferredSize(
        child: _buildMenuBar(),
        preferredSize: new Size.fromHeight(height - topPadding),
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Expanded(
            child: new ListView(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: new Text(
                    'LOG IN',
                    textAlign: TextAlign.center,
                  ),
                ),
                _buildFormBody(),
              ],
            ),
          ),
          new Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildSignInButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBar() {
    double height =
    Theme.of(context).platform == TargetPlatform.iOS ? 76.0 : 90.0;
    final topPadding = MediaQuery.of(context).padding.top;
    return new Material(
      color: Colors.red,
      child: new Container(
        height: height,
        padding: new EdgeInsets.only(top: topPadding),
        child: new Stack(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: new Align(
                alignment: FractionalOffset.centerRight,
                child: new MaterialButton(
                  child: new Text(
                    'FORGOT PASSWORD?',
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormBody() {
    return new Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.red,
      ),
      child: new Form(
        key: _formKey,
        autovalidate: _autovalidate,
        onWillPop: null,
        child: new Column(
          children: <Widget>[
            _buildEmailTextField(),
            _buildPasswordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: new ConstrainedBox(
        constraints: new BoxConstraints.expand(
          height: 50.0,
        ),
        child: new MaterialButton(
          onPressed: () {},
        ),
      ),
    );
  }

  TextEditingController _getControllerForKey(
      String key, {
        String initialValue,
      }) {
    TextEditingController controller;
    if (_controllers[key] != null) {
      controller = _controllers[key];
    } else {
      controller = new TextEditingController();
      _controllers[key] = controller;
      controller.text = new TextEditingValue(text: initialValue ?? '').text;
    }
    return controller;
  }

  Widget _buildEmailTextField() {
    final key = 'email';
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: _shouldHideKeyboard
          ? new FocusScope(
        node: new FocusScopeNode(),
        child: _buildTextFormFieldForEmail(key: key),
      )
          : _buildTextFormFieldForEmail(key: key),
    );
  }

  Widget _buildTextFormFieldForEmail({@required String key}) {
    final initialValue = '';
    return new EnsureVisibleWhenFocused(
      focusNode: _getFocusNodeForKey(key),
      child: new TextFormField(
        focusNode: _getFocusNodeForKey(key),
        controller: _getControllerForKey(key),
        initialValue: initialValue,
        autofocus: true,
        decoration: new InputDecoration(
          labelText: 'Email Address',
        ),
        keyboardType: TextInputType.emailAddress,
        onSaved: (String value) {
          _controllers[key].text = value;
        },
        validator: _validateField,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    final key = 'password';
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: _shouldHideKeyboard
          ? new FocusScope(
        node: new FocusScopeNode(),
        child: _buildTextFormFieldForPassword(key: key),
      )
          : _buildTextFormFieldForPassword(key: key),
    );
  }

  Widget _buildTextFormFieldForPassword({@required String key}) {
    return new EnsureVisibleWhenFocused(
      focusNode: _getFocusNodeForKey(key),
      child: new TextFormField(
        focusNode: _getFocusNodeForKey(key),
        controller: _getControllerForKey(key),
        decoration: new InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
        onSaved: (String value) {
          _controllers[key].text = value;
        },
        validator: _validateField,
      ),
    );
  }

  String _validateField(String text) {
    if (text.isEmpty) return 'Required';
    return null;
  }

  // textfield visibility helpers
  FocusNode _getFocusNodeForKey(String key) {
    FocusNode focusNode;
    if (_focusNodes[key] != null) {
      focusNode = _focusNodes[key];
    } else {
      focusNode = new FocusNode();
      _focusNodes[key] = focusNode;
    }
    return focusNode;
  }
}

/// A widget that ensures it is always visible when focused.
class EnsureVisibleWhenFocused extends StatefulWidget {
  const EnsureVisibleWhenFocused({
    Key key,
    @required this.child,
    @required this.focusNode,
    this.curve: Curves.ease,
    this.duration: const Duration(milliseconds: 100),
  })
      : super(key: key);

  /// The node we will monitor to determine if the child is focused
  final FocusNode focusNode;

  /// The child widget that we are wrapping
  final Widget child;

  /// The curve we will use to scroll ourselves into view.
  ///
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  ///
  /// Defaults to 100 milliseconds.
  final Duration duration;

  EnsureVisibleWhenFocusedState createState() =>
      new EnsureVisibleWhenFocusedState();
}

class EnsureVisibleWhenFocusedState extends State<EnsureVisibleWhenFocused> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_ensureVisible);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode.removeListener(_ensureVisible);
  }

  Future<Null> _ensureVisible() async {
    // Wait for the keyboard to come into view
    // TODO: position doesn't seem to notify listeners when metrics change,
    // perhaps a NotificationListener around the scrollable could avoid
    // the need insert a delay here.
    await new Future.delayed(const Duration(milliseconds: 300));

    if (!widget.focusNode.hasFocus) return;

    final RenderObject object = context.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    assert(viewport != null);

    ScrollableState scrollableState = Scrollable.of(context);
    assert(scrollableState != null);

    ScrollPosition position = scrollableState.position;
    double alignment;
    if (position.pixels > viewport.getOffsetToReveal(object, 0.0)) {
      // Move down to the top of the viewport
      alignment = 0.0;
    } else if (position.pixels < viewport.getOffsetToReveal(object, 1.0)) {
      // Move up to the bottom of the viewport
      alignment = 1.0;
    } else {
      // No scrolling is necessary to reveal the child
      return;
    }
    position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  Widget build(BuildContext context) => widget.child;
}