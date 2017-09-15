import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new bottomnavbar(),
    );
  }
}

class bottomnavbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _bottomnavbar();
  }
}

class _bottomnavbar extends State<bottomnavbar> {
  /// This controller can be used to programmatically
  /// set the current displayed page
  // PageController _pageController;

  // int _page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // appBar: new AppBar(
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: new Text("Settings"), automaticallyImplyLeading: false,
        //   actions: <Widget>[
        //     new IconButton(
        //       // action button
        //       icon: new Icon(Icons.check),
        //       onPressed: () {
        //         null;
        //       },
        //     ),
        //   ],
        //   backgroundColor: Colors.indigo,
        // ),
        body: new PageView(
            children: [
              new settings(),
              // new settings(),
              // new settings(),
              // new settings()
            ],

            /// Specify the page controller
            // controller: _pageController,
            // onPageChanged: onPageChanged
        ),
            // bottomNavigationBar: new BottomNavigationBar(
            //   items: [
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.account_circle), title: new Text("z")),
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.people), title: new Text("a")),
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.tune), title: new Text("b")),
            //     new BottomNavigationBarItem(
            //         icon: new Icon(Icons.person), title: new Text("c"))
            //   ],
            // /// Will be used to scroll to the next page
            // /// using the _pageController
            // onTap: navigationTapped,
            // currentIndex: _page)
        );
  }

  // /// Called when the user presses on of the
  // /// [BottomNavigationBarItem] with corresponding
  // /// page index
  // void navigationTapped(int page) {
  //   // Animating to the page.
  //   // You can use whatever duration and curve you like
  //   _pageController.animateToPage(page,
  //       duration: const Duration(milliseconds: 10), curve: Curves.ease);
  // }

  // void onPageChanged(int page) {
  //   setState(() {
  //     this._page = page;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = new PageController();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _pageController.dispose();
  // }
}

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new ListView.builder(
          itemCount: 40,
          itemExtent: 40.0,
          itemBuilder: (BuildContext context, int index) {
            return new TextField(
              decoration: new InputDecoration(
                hintText: index.toString(),
              ),
            );
            // return new Row(
            //   children: <Widget>[
            //     // new Text(index.toString()),
            //     new TextField(),
            //   ],
            // );
          },
        ),
          // children: [

            // new Container(
            //   height: 50.0,
            //   color: Colors.teal,
            //   padding: const EdgeInsets.only(
            //     top: 14.0,
            //     left: 8.0,
            //   ),
            //   child: new Text('''DEFAULT SETTINGS''',
            //       softWrap: true,
            //   ),
            // ),
            // new Container(
            //   padding: const EdgeInsets.only(
            //       top: 0.0, left: 8.0, right: 8.0, bottom: 0.0),

            //   child: new TextField(
            //     decoration: new InputDecoration(
            //       hintText: 'xyzzy',
            //       labelText: 'xyzzy',
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // new Container(
            //   padding: const EdgeInsets.only(
            //       top: 0.0, left: 8.0, right: 8.0, bottom: 0.0),

            //   child: new TextField(
            //     decoration: new InputDecoration(
            //       hintText: 'xyzzy',
            //       labelText: 'xyzzy',
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // new Container(
            //   height: 50.0,
            //   color: Colors.tealAccent,
            //   padding: const EdgeInsets.only(
            //     top: 14.0,
            //     left: 8.0,
            //   ),
            //   child: new Text('''xyzzy''',
            //       softWrap: true,
            //   ),
            // ),
            // new Container(
            //   padding: const EdgeInsets.only(
            //       top: 0.0, left: 8.0, right: 8.0, bottom: 0.0),
            //   child: new TextField(
            //     decoration: new InputDecoration(
            //       hintText: 'xyzzy',
            //       labelText: 'xyzzy',
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // new Container(
            //   child: new TextField(),
            // ),
            // new Container(
            //   child: new TextField(),
            // ),
          // ],
        // )
      );
  }
}
