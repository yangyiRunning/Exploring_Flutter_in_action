import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/CommonNotification.dart';
import 'common/CommonShowModel.dart';

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
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  AppThemeNotification appThemeNotification = new AppThemeNotification(true);
  bool isFABShow = true;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      floatingActionButton: isFABShow
          ? FloatingActionButton(
              child: Icon(Icons.format_paint),
              onPressed: () {
                appThemeNotification.isLight = !appThemeNotification.isLight;
                appThemeNotification.dispatch(context);
              },
            )
          : null,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(
                Icons.android,
                color: Colors.white,
              ),
              onPressed: () {
                switchOS(TargetPlatform.android);
                SystemNavigator.pop(animated:true);
              },
            ),
          ),
          Container(
              child: IconButton(
            icon: Icon(
              Icons.phone_iphone,
              color: Colors.white,
            ),
            onPressed: () {
              switchOS(TargetPlatform.iOS);
              SystemNavigator.pop(animated:true);
            },
          ))
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification.runtimeType == ScrollUpdateNotification) {
            setState(() {
              isFABShow = false;
            });
          }
          if (notification.runtimeType == ScrollEndNotification ||
              notification.runtimeType == ScrollStartNotification) {
            setState(() {
              isFABShow = true;
            });
          }
          return true;
        },
        child: Scrollbar(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1.5,
            ),
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            itemCount: getMainList(context).length,
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.amberAccent[100],
                    child: getMainList(context)[index],
                  ),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.deepPurple[100],
                    child: getMainList(context)[index],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
