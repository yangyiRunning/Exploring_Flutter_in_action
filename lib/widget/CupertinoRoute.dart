import 'package:flutter/cupertino.dart';

class CupertinoRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CupertinoState();
  }
}

class CupertinoState extends State<CupertinoRoute> {
  var arg;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    arg = ModalRoute.of(context).settings.arguments;
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("$arg"),
        ),
        child: Center(
          child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("点击+1"),
            onPressed: () {
              setState(() {
                value++;
                print("点击了" + value.toString() + "次");
              });
            },
          ),
        ));
  }
}
