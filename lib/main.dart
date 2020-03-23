import 'package:flutter/material.dart';
import 'package:flutter_app/random/RandomWord.dart';
import 'package:flutter_app/widget/CupertinoRoute.dart';
import 'package:flutter_app/widget/SnackBarWidget.dart';
import 'package:flutter_app/widget/StateCounter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //应用名称
      title: 'Flutter Demo',
      //应用主题
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: {
        "NewRoute": (context) => NewRoute(),
        "ResultRoute": (context) => ResultRoute(),
        "TipRoute": (context) => TipRoute(),
        "RandomWord": (context) => RandomWord(),
        "StateCounter": (context) => StateCounterWidget(),
        "SnackBarWidget": (context) => SnackBarWidget(),
        "CupertinoRoute": (context) => CupertinoRoute()
      },
      //路由生成的钩子
//      onGenerateRoute: (RouteSettings settings) {
//        return MaterialPageRoute(builder: (context) {
//          String routeName = settings.name;
//          //如果访问的路由页面需要登录，而当前未登录，则直接返回登录页面的路由
//          //引导用户的登录，其他情况则正常打开路由页面
//
//        });
//      },
      //应用首页面
      home: MyHomePage(title: 'Home Page'),
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //状态自增函数
  void _incrementCounter() {
    //通知flutter框架，有状态发生了改变，flutter框架收到通知后，会执行build方法根据新的状态重新构建界面
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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("跳转至带状态的计数器界面"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "StateCounter", arguments: "到此一游");
              },
            ),
            FlatButton(
              child: Text("跳转至路由界面 NewRoute"),
              textColor: Colors.blue,
              onPressed: () {
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  return NewRoute();
//                }));
                Navigator.pushNamed(context, "NewRoute");
              },
            ),
            FlatButton(
              child: Text("携带参数跳转界面 ResultRoute"),
              textColor: Colors.blue,
              onPressed: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return ResultRoute();
//                }));
                Navigator.pushNamed(context, "ResultRoute");
              },
            ),
            FlatButton(
              child: Text("生成一串英文的随机字符串"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "RandomWord");
              },
            ),
            FlatButton(
              child: Text("Dump App"),
              textColor: Colors.blue,
              onPressed: () {
                debugDumpApp();
              },
            ),
            FlatButton(
              child: Text("子Widget树获取父级StatefulWidget的State对象"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "SnackBarWidget",
                    arguments: "传个参证明我来过");
              },
            ),
            FlatButton(
              child: Text("跳转至一个苹果风格的界面"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(
                    context, "CupertinoRoute", arguments: "苹果风格的界面");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("这是一个路由界面"),
      ),
      body: new Center(
        child: new Text("我把界面的内容放在中间"),
      ),
    );
  }
}

class ResultRoute extends StatelessWidget {
  var result;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
//            result = await Navigator.push(context,
//                MaterialPageRoute(builder: (context) {
//              return new TipRoute(text: "进入时传递的参数");
//            }));
            result = await Navigator.pushNamed(context, "TipRoute",
                arguments: "进入时传递的参数");
            print("路由返回值:" + result);
          },
          child: Text("打开提示页面"),
        ),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  var text;

  @override
  Widget build(BuildContext context) {
    text = ModalRoute
        .of(context)
        .settings
        .arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("带参数的路由页面 TipRoute"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, "结束页面时的返回值");
              },
              child: Text("返回"),
            )
          ],
        ),
      ),
    );
  }
}
