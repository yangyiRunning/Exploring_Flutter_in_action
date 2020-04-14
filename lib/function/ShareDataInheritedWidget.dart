import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class ShareDataInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShareDataInheritedState();
  }
}

class ShareDataInheritedState extends State<ShareDataInheritedWidget> {
  String text = "好!";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("点击追加一个String"),
              onPressed: () {
                setState(() {
                  text += "好!";
                });
              },
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.amberAccent[100],
                //数据共享控件ShareDataWidget
                child: ShareDataWidget(
                  text: text,
                  //传递给自定义的子控件MyDependOnTextWidget，观测输出
                  child: MyDependOnTextWidget(),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue[100],
                //数据共享控件ShareDataWidget
                child: ShareDataWidget(
                  text: text,
                  //传递给自定义的子控件MyDependOnTextWidget，观测输出
                  child: MyUnDependOnTextWidget(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//---------------------------------------------------------------------------

//继承InheritedWidget实现一个共享数据控件
class ShareDataWidget extends InheritedWidget {
  final String text;

  ShareDataWidget({@required this.text, Widget child}) : super(child: child);

  //获得一个子控件可依赖的共享控件(dependOnInheritedWidgetOfExactType为获得一个注册了子Widget的依赖关系的Widget)
  static ShareDataWidget getDependOnShareDataWidget(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>() ??
        Text("虚位以待");
  }

  //获得一个子控件不可依赖的共享控件(getElementForInheritedWidgetOfExactType为获得一个没有注册子Widget的依赖关系的Widget)
  static ShareDataWidget getUnDependOnShareDataWidget(BuildContext context) {
    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget ??
        Text("虚位以待");
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    // 更新之后是否通知子控件，true为通知，false为不通知
    // 新旧值不相等时，通知子树中依赖data的Widget，子树中依赖data的Widget的state的didChangeDependencies周期函数会被调用
    return oldWidget.text != text;
  }
}

//---------------------------------------------------------------------------

//实现一个特殊的Text控件，直接依赖ShareDataWidget控件中的text数据
class MyDependOnTextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDependOnTextState();
  }
}

class MyDependOnTextState extends State<MyDependOnTextWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      ShareDataWidget.getDependOnShareDataWidget(context).text,
      style: TextStyle(fontSize: 18, color: Colors.grey),
    );
  }

  @override
  void didChangeDependencies() {
    //if ( 当父Widget中通过dependOnInheritedWidgetOfExactType获取Widget &&  updateShouldNotify返回true）调用此周期方法
    super.didChangeDependencies();
    print("MyDependOnTextState 引用共享数据控件中的text值发生了变化");
  }
}

//---------------------------------------------------------------------------

//实现一个特殊的Text控件，不依赖ShareDataWidget控件中的text数据
class MyUnDependOnTextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyUnDependOnTextState();
  }
}

class MyUnDependOnTextState extends State<MyUnDependOnTextWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      ShareDataWidget.getUnDependOnShareDataWidget(context).text,
      style: TextStyle(fontSize: 18, color: Colors.grey),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //正常情况下因为此控件没有注册与子控件的依赖关系，所以此行在控制台不会输出
    print("MyUnDependOnTextWidget 引用共享数据控件中的text值发生了变化");
  }
}
