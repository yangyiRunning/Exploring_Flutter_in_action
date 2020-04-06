import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class LoginFormWidget extends StatefulWidget {
  @override
  LoginFormState createState() {
    // TODO: implement createState
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginFormWidget> {
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  bool initCheckStatus = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      //最外层必须有一个表单的节点，否则最后提交时的formState会报NPE
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "用户名",
                  hintText: "用户名长度不能超过10个字符",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              maxLength: 10,
              maxLengthEnforced: false,
              validator: (v) {
                return v.trim().length < 10 ? null : "用户名长度不能超过10个字符";
              },
              onSaved: (v) {
                print("保存用户名 $v 成功");
              },
            ),
            TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "密码长度不能超过10个字符",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              maxLength: 10,
              maxLengthEnforced: false,
              validator: (v) {
                return v.trim().length < 10 ? null : "密码长度不能超过10个字符";
              },
              onSaved: (v) {
                print("保存密码 $v 成功");
              },
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: initCheckStatus,
                  activeColor: Colors.blue,
                  onChanged: (v) {
                    setState(() {
                      initCheckStatus = v;
                    });
                  },
                ),
                Text("请勾选隐私协议")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(builder: (context) {
                  return RaisedButton(
                    child: Text("登录"),
                    textColor: Colors.white,
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    //正常状态下的阴影
                    elevation: 2.0,
                    //按下时的阴影
                    highlightElevation: 8.0,
                    // 禁用时的阴影
                    disabledElevation: 0.0,
                    onPressed: () {
                      FormState formState = Form.of(context);
                      //开启全表单验证
                      //FormState.validate()：调用此方法后，会调用Form子孙FormField的validate回调，如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示。
                      if (formState.validate()) {
                        if (initCheckStatus) {
                          //FormState.save()：调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容
                          formState.save();
                          ScaffoldState scaffoldState =
                              context.findAncestorStateOfType<ScaffoldState>();
                          scaffoldState.showSnackBar(SnackBar(
                            content: Text("表单保存成功"),
                          ));
                        } else {
                          ScaffoldState scaffoldState =
                              context.findAncestorStateOfType<ScaffoldState>();
                          scaffoldState.showSnackBar(SnackBar(
                            content: Text("请先勾选同意隐私协议"),
                          ));
                        }
                      }
                    },
                  );
                }),
                SizedBox(width: 10),
                Builder(builder: (context) {
                  return RaisedButton(
                    child: Text("重置"),
                    textColor: Colors.white,
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    //正常状态下的阴影
                    elevation: 2.0,
                    //按下时的阴影
                    highlightElevation: 8.0,
                    // 禁用时的阴影
                    disabledElevation: 0.0,
                    onPressed: () {
                      FormState formState = Form.of(context);
                      //FormState.reset()：调用此方法后，会将子孙FormField的内容清空。
                      formState.reset();
                      setState(() {
                        initCheckStatus = false;
                      });
                    },
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
