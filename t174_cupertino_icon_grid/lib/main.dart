import 'package:flutter/cupertino.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cupertino Icons'),
        ),
        child: SafeArea(
          child: IconTheme(
            data: IconThemeData(size: 42, color: CupertinoColors.activeBlue),
            child: GridView.count(
              padding: EdgeInsets.all(24),
              crossAxisCount: 4,
              children: [
                Icon(CupertinoIcons.share),
                Icon(CupertinoIcons.book),
                Icon(CupertinoIcons.bookmark),
                Icon(CupertinoIcons.info),
                Icon(CupertinoIcons.reply),
                Icon(CupertinoIcons.profile_circled),
                Icon(CupertinoIcons.plus_circled),
                Icon(CupertinoIcons.flag),
                Icon(CupertinoIcons.search),
                Icon(CupertinoIcons.check_mark),
                Icon(CupertinoIcons.back),
                Icon(CupertinoIcons.home),
                Icon(CupertinoIcons.shopping_cart),
                Icon(CupertinoIcons.phone),
                Icon(CupertinoIcons.shuffle),
                Icon(CupertinoIcons.photo_camera),
                Icon(CupertinoIcons.collections),
                Icon(CupertinoIcons.folder),
                Icon(CupertinoIcons.delete),
                Icon(CupertinoIcons.pen),
                Icon(CupertinoIcons.clear),
                Icon(CupertinoIcons.refresh),
                Icon(CupertinoIcons.add),
                Icon(CupertinoIcons.music_note),
                Icon(CupertinoIcons.loop),
                Icon(CupertinoIcons.clock),
                Icon(CupertinoIcons.volume_down),
                Icon(CupertinoIcons.fullscreen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

