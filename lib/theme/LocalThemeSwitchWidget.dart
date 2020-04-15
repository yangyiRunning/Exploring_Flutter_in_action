import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class LocalThemeSwitchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LocalThemeSwitchState();
  }
}

class LocalThemeSwitchState extends State<LocalThemeSwitchWidget> {
  ThemeData themeDataBlue = new ThemeData(
    primarySwatch: Colors.blue,
    cardColor: Colors.blue,
    dividerColor: Colors.blue,
    cursorColor: Colors.blue,
    iconTheme: IconThemeData(color: Colors.blue),
  );

  ThemeData themeDataRed = new ThemeData(
    primarySwatch: Colors.red,
    cardColor: Colors.red,
    dividerColor: Colors.red,
    cursorColor: Colors.red,
    iconTheme: IconThemeData(color: Colors.red),
  );

  ThemeData subTheme = new ThemeData(
    iconTheme: IconThemeData(color: Colors.deepPurple),
  );

  bool isBlue = true;
  bool isSwitchButton = true;
  EdgeInsetsGeometry edgeInsetsGeometry = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Theme(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.format_paint,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isBlue = !isBlue;
            });
          },
        ),
        appBar: getAppBar(arg),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: getLocalThemeWidgetList(context),
            ),
          ),
        ),
      ),
      data: isBlue ? themeDataBlue : themeDataRed,
    );
  }

  List<Widget> getLocalThemeWidgetList(BuildContext context) {
    List<Widget> localThemeWidget = [];

    localThemeWidget.add(Container(
      margin: edgeInsetsGeometry,
      child: Icon(
        Icons.palette,
        size: 50,
      ),
    ));

    localThemeWidget.add(Container(
      margin: edgeInsetsGeometry,
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: "这是一个可点击的编辑框", hintStyle: TextStyle(fontSize: 20)),
      ),
    ));

    localThemeWidget.add(Container(
      child: Text(
        "踩坑Flutter(字体默认不跟随主题变动)",
        style: TextStyle(fontSize: 20),
      ),
      margin: edgeInsetsGeometry,
    ));

    localThemeWidget.add(Container(
      child: CircularProgressIndicator(
        strokeWidth: 10,
        backgroundColor: Colors.grey,
        value: null,
      ),
      margin: edgeInsetsGeometry,
    ));

    localThemeWidget.add(Container(
      child: Switch(
        value: isSwitchButton,
        onChanged: (b) {
          print(b);
          setState(() {
            isSwitchButton = b;
          });
        },
      ),
      margin: edgeInsetsGeometry,
    ));

    localThemeWidget.add(Container(
      child: Card(
        child: Text(
          "这是一个卡片",
          style: TextStyle(fontSize: 30),
        ),
      ),
      margin: edgeInsetsGeometry,
    ));

    localThemeWidget.add(Container(
      child: Theme(
          data: subTheme,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.person,
                size: 50,
              ),
              Text(
                "子主题覆盖原有主题",
                style: TextStyle(fontSize: 25),
              )
            ],
          )),
      margin: edgeInsetsGeometry,
    ));

    return localThemeWidget;
  }
}
