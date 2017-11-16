import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new IosDemoApp());
}

const Color _blue = const Color(0xFF007AFF);
const Color _gray = const Color(0xFF929292);

class IosDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(platform: TargetPlatform.iOS),
        title: 'iOS Demo',
        home: new DefaultTextStyle(
            style: const TextStyle(
                color: CupertinoColors.black,
                decorationStyle: null,
                fontFamily: '.SF UI Text'),
            child: new DecoratedBox(
                decoration: const BoxDecoration(color: CupertinoColors.white),
                child: new CupertinoTabScaffold(
                    tabBar:
                        new CupertinoTabBar(items: <BottomNavigationBarItem>[
                      new BottomNavigationBarItem(
                          icon: new ImageIcon(
                              const AssetImage('assets/file.png')),
                          title: new Text('Repository')),
                      new BottomNavigationBarItem(
                          icon: new Icon(Icons.call_merge, size: 28.0),
                          title: new Text('Pull Requests')),
                      new BottomNavigationBarItem(
                          icon:
                              new ImageIcon(const AssetImage('assets/bug.png')),
                          title: new Text('Issues')),
                      new BottomNavigationBarItem(
                          icon: new ImageIcon(
                              const AssetImage('assets/comments.png')),
                          title: new Text('Notifications'))
                    ]),
                    tabBuilder: (BuildContext context, int index) {
                      return new CupertinoTabView(
                          builder: (BuildContext context) {
                        return new CupertinoPageScaffold(
                            navigationBar: buildNavigationBar(),
                            child: () {
                              switch (index) {
                                case 0:
                                  return buildTab1();
                                case 1:
                                  return buildTab2();
                                case 2:
                                  return buildTab3(context);
                                case 3:
                                  return buildTab4(context);
                                default:
                                  return new Container();
                              }
                            }());
                      });
                    }))));
  }
}

CupertinoNavigationBar buildNavigationBar() {
  return new CupertinoNavigationBar(
      leading: new CupertinoButton(
          padding: const EdgeInsets.all(0.0),
          child: const Text('Cancel'),
          pressedOpacity: 1.0,
          onPressed: () {}),
      middle: const Text('Add neural reading…',
          style: const TextStyle(fontWeight: FontWeight.w700)),
      trailing: const ImageIcon(const AssetImage('assets/search.png'))
      // largeTitle: true,
      );
}

Widget buildTab1() {
  return new Center(child: new FlutterLogo(size: 100.0));
}

Widget buildTab2() {
  return new ListView(
      children: <Widget>[
    new Padding(padding: const EdgeInsets.only(top: 60.0)),
  ]
        ..addAll(buildHeader())
        ..addAll(buildComments()));
}

Widget buildTab3(BuildContext context) {
  return new Center(
      child: new CupertinoButton(
          child: const Text('Next Page'),
          onPressed: () {
            Navigator.push(context,
                new CupertinoPageRoute(builder: (BuildContext context) {
              return new CupertinoPageScaffold(
                  navigationBar:
                      new CupertinoNavigationBar(middle: const Text('Page 2')),
                  child: new Center(
                      child: new Column(children: <Widget>[
                    new Padding(padding: const EdgeInsets.only(top: 100.0)),
                    const Text('Page 2'),
                    new CupertinoButton(
                        child: const Text('Next Page'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new CupertinoPageRoute(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return new CupertinoPageScaffold(
                                        navigationBar:
                                            const CupertinoNavigationBar(
                                                middle: const Text('Page 3')),
                                        child: new Center(
                                            child: const Text('Page 3')));
                                  }));
                        })
                  ])));
            }));
          }));
}

Widget buildTab4(BuildContext context) {
  return new Center(
      child: new CupertinoButton(
          child: const Text('Next Page'),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return new Column(children: <Widget>[
                const Text('Page 2'),
                new CupertinoButton(
                    child: const Text('Back'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
            }));
          }));
}

List<Widget> buildHeader() {
  return <Widget>[
    new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new ClipRRect(
            borderRadius: const BorderRadius.all(const Radius.circular(16.0)),
            child:
                new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              new Container(
                  decoration:
                      const BoxDecoration(color: const Color(0xFFE5E5E5)),
                  child: new Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 12.0),
                      child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text('PULL REQUEST',
                                style: const TextStyle(
                                    color: const Color(0xFF646464),
                                    letterSpacing: -0.8,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500)),
                            const Text('Show More',
                                style: const TextStyle(
                                    color: const Color(0xFF646464),
                                    letterSpacing: -0.6,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500))
                          ]))),
              new Container(
                  decoration:
                      const BoxDecoration(color: const Color(0xFFF3F3F3)),
                  child: new Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 12.0),
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                                'Add Neural Reading Functions via Implant Interface #204',
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.6)),
                            new Padding(
                                padding: const EdgeInsets.only(top: 16.0)),
                            new Text('REVIEWERS',
                                style: const TextStyle(
                                    color: const Color(0xFF646464),
                                    fontSize: 12.0,
                                    letterSpacing: -0.6,
                                    fontWeight: FontWeight.w500)),
                            new Padding(
                                padding: const EdgeInsets.only(top: 8.0)),
                            new Row(children: <Widget>[
                              const CircleAvatar(
                                  backgroundImage:
                                      const AssetImage('assets/reviewer1.jpeg'),
                                  radius: 22.0),
                              new Padding(
                                  padding: const EdgeInsets.only(left: 2.0)),
                              new Image(
                                  image: const AssetImage('assets/check-2.png'),
                                  width: 30.0),
                              new Padding(
                                  padding: const EdgeInsets.only(left: 8.0)),
                              const CircleAvatar(
                                  backgroundImage:
                                      const AssetImage('assets/reviewer4.jpg'),
                                  radius: 22.0),
                              new Padding(
                                  padding: const EdgeInsets.only(left: 2.0)),
                              new Image(
                                  image:
                                      const AssetImage('assets/comments-2.png'),
                                  width: 30.0)
                            ])
                          ])))
            ])))
  ];
}

List<Widget> buildControl() {
  return <Widget>[
    new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
      new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new DecoratedBox(
              decoration: new BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0)),
                  border: new Border.all(color: const Color(0xAAAACCEE)),
                  color: const Color(0xAAF0FAFF)),
              child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('Reviewers',
                            style: const TextStyle(
                                // fontSize: 24.0,
                                fontWeight: FontWeight.w600)),
                        new Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0, right: 3.0),
                            child: new Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Column(children: <Widget>[
                                    const CircleAvatar(
                                      backgroundImage: const AssetImage(
                                          'assets/reviewer1.jpeg'),
                                      radius: 22.0,
                                    ),
                                    const Icon(Icons.done,
                                        color: const Color(0xDD66DD44))
                                  ]),
                                  const Padding(
                                      padding:
                                          const EdgeInsets.only(left: 8.0)),
                                  new Column(children: <Widget>[
                                    const CircleAvatar(
                                        backgroundImage: const AssetImage(
                                            'assets/reviewer4.jpg'),
                                        radius: 22.0),
                                    const Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0)),
                                    const Icon(Icons.chat_bubble_outline,
                                        color: const Color(0xDDDBAB09),
                                        size: 20.0)
                                  ])
                                ]))
                      ])))),
      new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new Container(
            decoration: new BoxDecoration(
                shape: BoxShape.circle, border: new Border.all(color: _blue)),
            margin: const EdgeInsets.only(right: 12.0),
            padding: const EdgeInsets.all(4.0),
            child: const Image(
                image: const AssetImage('assets/plus.png'),
                color: _blue,
                width: 25.0)),
        new Container(
            decoration: new BoxDecoration(
                shape: BoxShape.circle, border: new Border.all(color: _blue)),
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.all(4.0),
            child: const Image(
                image: const AssetImage('assets/up.png'),
                color: _blue,
                width: 25.0))
      ])
    ])
  ];
}

List<Widget> buildComments() {
  return <Widget>[
    new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(18.0)),
                  color: _blue),
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: const Text('Hey guys, check this out',
                  style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w300)))
        ]),
    new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Container(
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: new LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: <Color>[
                        const Color(0xFFFD5015),
                        const Color(0xFFC72008)
                      ])),
              margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              padding: const EdgeInsets.all(12.0),
              child: new Text('LA',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500))),
          new Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(18.0)),
                  color: const Color(0xFFE5E5EA)),
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: const Text('Wow, that\'s pretty impressive.\nGood job!',
                  style: const TextStyle(
                      color: Colors.black,
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w400)))
        ]),
    new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(18.0)),
                  color: _blue),
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: const Text('Let\'s roll it out during I/O',
                  style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w300)))
        ]),
    new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Container(
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: new LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: <Color>[
                        const Color(0xFF34CAD6),
                        const Color(0xFF24AAB6)
                      ])),
              margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              padding: const EdgeInsets.all(12.0),
              child: new Text('DA',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500))),
          new Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(18.0)),
                  color: const Color(0xFFE5E5EA)),
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: const Text(
                  '+cc laywercat@', //, hi guys, what\'s\nhappening. I\'m gonna need\neveryone to go ahead and come\nin tomorrow. So if you could\nbe here at around 9 that\'d\n be great',
                  style: const TextStyle(
                      color: Colors.black,
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w400)))
        ]),
    new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(18.0)),
                  color: _blue),
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: const Text('Let me know if I should hold\noff for now',
                  style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w300)))
        ])
  ];
}

class IosAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ClipRect(
        child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new SizedBox(
                height: 45.0 + MediaQuery.of(context).padding.top,
                child: new DecoratedBox(
                    decoration: new BoxDecoration(
                        color: const Color(0xDDF8F8F8),
                        border: const Border(
                            bottom: const BorderSide(
                                width: 0.5,
                                style: BorderStyle.solid,
                                color: const Color(0xAABBBBBB)))),
                    child: new Padding(
                        padding: new EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: const Icon(Icons.arrow_back_ios,
                                      color: _blue, size: 27.0)),
                              const Center(
                                  child: const Text('List',
                                      style: const TextStyle(
                                          color: _blue, fontSize: 17.0))),
                              new Expanded(
                                  child: new Center(
                                      child: new Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                    const Text('Add Neural Reading…',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -0.8))
                                  ]))),
                              const Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: const Image(
                                      image:
                                          const AssetImage('assets/search.png'),
                                      color: _blue,
                                      width: 27.0))
                            ]))))));
  }
}
