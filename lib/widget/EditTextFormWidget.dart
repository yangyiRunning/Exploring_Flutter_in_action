import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTextFormWidget extends StatefulWidget {
  @override
  EditTextFormState createState() {
    // TODO: implement createState
    return EditTextFormState();
  }
}

class EditTextFormState extends State<EditTextFormWidget> {
  final maxLength = 10;
  TextEditingController textEditingController = new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScope;

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("$arg"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              TextField(
                autofocus: true,
                //是否自动获取焦点
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person),
                    //用是否聚焦的方式自定义下划线颜色
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
                maxLength: maxLength,
                maxLengthEnforced: false,
                controller: textEditingController,
                onChanged: (v) {
                  print("onChanged文本内容$v");
                  print(
                      "textEditingController文本内容" + textEditingController.text);
                }, //true为超出maxLength所设置的值后不让输入，false为超出之后可以输入，但是输入框会变红警示。
              ),
              TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "登录密码",
                      prefixIcon: Icon(Icons.lock),
                      //用style的方式自定义下划线颜色
                      hintStyle: TextStyle(color: Colors.amber, fontSize: 16)),
                  //输入为password的类型
                  obscureText: true,
                  maxLength: maxLength,
                  maxLengthEnforced: true),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "电子邮件地址(不带下划线)",
                    prefixIcon: Icon(Icons.email),
                    //隐藏下划线
                    border: InputBorder.none
                    ),
              ),
              Builder(builder: (context) {
                return Column(
                  children: <Widget>[
                    TextField(
                      autofocus: true,
                      focusNode: focusNode1,
                      decoration: InputDecoration(
                          labelText: "输入框1",
                          hintText: "输入框1",
                          prefixIcon: Icon(Icons.print)),
                    ),
                    RaisedButton(
                      child: Text("获取第二个输入框的焦点"),
                      onPressed: () {
                        focusScope = FocusScope.of(context);
                        if (focusScope != null) {
                          focusScope.requestFocus(focusNode2);
                          ScaffoldState scaffoldState =
                              context.findAncestorStateOfType<ScaffoldState>();
                          scaffoldState.showSnackBar(SnackBar(
                            content: Text("获取第二个输入框的焦点"),
                          ));
                        }
                      },
                    )
                  ],
                );
              }),
              Builder(builder: (context) {
                return Column(
                  children: <Widget>[
                    TextField(
                      autofocus: true,
                      focusNode: focusNode2,
                      decoration: InputDecoration(
                          labelText: "输入框2",
                          hintText: "输入框2",
                          prefixIcon: Icon(Icons.print)),
                    ),
                    RaisedButton(
                      child: Text("获取第一个输入框的焦点"),
                      onPressed: () {
                        focusScope = FocusScope.of(context);
                        if (focusScope != null) {
                          focusScope.requestFocus(focusNode1);
                          ScaffoldState scaffoldState =
                              context.findAncestorStateOfType<ScaffoldState>();
                          scaffoldState.showSnackBar(SnackBar(
                            content: Text("获取第一个输入框的焦点"),
                          ));
                        }
                      },
                    )
                  ],
                );
              }),
              RaisedButton(
                child: Text("消去输入框1和输入框2的焦点"),
                onPressed: () {
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
              )
            ]),
          ),
        ));
  }
}
