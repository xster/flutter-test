import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showSheet1(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => NavigableSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: null,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSheet1(context),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NavigableSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigableSheetState();
}

class _NavigableSheetState extends State<NavigableSheet> {
  bool _showFirst = true;

  Widget _selectSheet() {
    if (_showFirst) {
      return Column(children: [
        Text('You are on page 1', style: TextStyle(fontSize: 40)),
        SizedBox(height: 32),
        FloatingActionButton(
          onPressed: () => setState(() => _showFirst = false),
          child: Icon(Icons.arrow_right),
        ),
      ]);
    } else {
      return Column(children: [
        Text('You are on page 2', style: TextStyle(fontSize: 40)),
        SizedBox(height: 32),
        FloatingActionButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_downward),
        ),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) => _selectSheet();
}