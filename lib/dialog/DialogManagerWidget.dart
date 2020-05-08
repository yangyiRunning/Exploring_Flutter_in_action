import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogManagerWidget extends StatefulWidget {
  @override
  DialogManagerState createState() {
    // TODO: implement createState
    return DialogManagerState();
  }
}

class DialogManagerState extends State<DialogManagerWidget> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("AlertDialog"),
                onPressed: () async {
                  bool exit = await getAlertDialog();
                  //当没有手动设置返回值时等于null
                  if (exit == null) {
                    //点击了dialog外部
                    Fluttertoast.showToast(msg: "取消退出");
                  } else {
                    Fluttertoast.showToast(msg: "已确认退出");
                  }
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("SimpleDialog"),
                onPressed: () {
                  getSimpleDialog();
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("ListDialog"),
                onPressed: () async {
                  int index = await getListDialog();
                  if (index != null) {
                    Fluttertoast.showToast(msg: "$index");
                  }
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("对话框状态管理(StatefulBuilder)"),
                onPressed: () async {
                  bool isDelete = await getStateDialogByStatefulBuilder();
                  if (isDelete == null) {
                    Fluttertoast.showToast(msg: "取消删除");
                  } else {
                    Fluttertoast.showToast(msg: "已删除");
                  }
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("对话框状态管理(markNeedsBuild)"),
                onPressed: () async {
                  bool isDelete = await getStateDialogByMarkNeedsBuild();
                  if (isDelete == null) {
                    Fluttertoast.showToast(msg: "取消删除");
                  } else {
                    Fluttertoast.showToast(msg: "已删除");
                  }
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("底部sheet"),
                onPressed: () async {
                  int index = await getModalBottomSheet();
                  Fluttertoast.showToast(msg: "$index");
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("加载框"),
                onPressed: () async {
                  bool isLoading = await getLoadingDialog();
                  if (isLoading == null) {
                    Fluttertoast.showToast(msg: "加载失败");
                  } else {
                    Fluttertoast.showToast(msg: "正在加载");
                  }
                },
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: RaisedButton(
                child: getNormalBlueText("日历选择"),
                onPressed: () async {
                  var date = await getDataPicker();
                  if (date == null) {
                    Fluttertoast.showToast(msg: "选择日期失败");
                  } else {
                    Fluttertoast.showToast(msg: "选择的日期为: $date");
                  }
                },
              )),
        ],
      ),
    );
  }

  Future<bool> getAlertDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            titleTextStyle: TextStyle(color: Colors.blue),
            content: Text("是否确认退出？"),
            contentTextStyle: TextStyle(color: Colors.blue),
            elevation: 10,
            actions: <Widget>[
              FlatButton(
                child: getNormalBlueText("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("退出"),
                onPressed: () {
                  //pop后的返回值为true，你没有看错，关掉一个dialog的方法和关掉一个页面的方法是一样的
                  //第一个pop为关闭弹出框
                  Navigator.of(context).pop(true);
                  //第二个pop为关闭当前页面
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<bool> getSimpleDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: getNormalBlueText("国家列表"),
            children: <Widget>[
              FlatButton(
                child: getNormalBlueText("中国"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "中国");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("美国"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "美国");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("欧盟"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "欧盟");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("日本"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "日本");
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: getNormalBlueText("其他"),
                onPressed: () {
                  Fluttertoast.showToast(msg: "其他");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<int> getListDialog() {
    return showDialog<int>(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 10,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return ListTile(
                    title: Text("点击下列列表项"),
                  );
                }
                return ListTile(
                  title: Text("$index"),
                  onTap: () {
                    Navigator.of(context).pop(index);
                  },
                );
              },
              shrinkWrap: true,
              itemCount: 40,
            ),
          );
        });
  }

  bool isRecursiveDelete = false;

  Future<bool> getStateDialogByStatefulBuilder() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("是否删除当前文件?"),
                //给复选框传递正确的上下文context
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Row(
                      children: <Widget>[
                        Text("是否连带删除子文件夹"),
                        Checkbox(
                          value: isRecursiveDelete,
                          onChanged: (bool value) {
                            setState(() {
                              isRecursiveDelete = !isRecursiveDelete;
                            });
                          },
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  Navigator.of(context).pop(isRecursiveDelete);
                },
              ),
            ],
          );
        });
  }

  Future<bool> getStateDialogByMarkNeedsBuild() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("是否删除当前文件?"),
                //给复选框传递正确的上下文context
                Builder(
                  builder: (context) {
                    return Row(
                      children: <Widget>[
                        Text("是否连带删除子文件夹"),
                        Checkbox(
                          value: isRecursiveDelete,
                          onChanged: (bool value) {
                            (context as Element).markNeedsBuild();
                            setState(() {
                              isRecursiveDelete = !isRecursiveDelete;
                            });
                          },
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  Navigator.of(context).pop(isRecursiveDelete);
                },
              ),
            ],
          );
        });
  }

  Future<int> getModalBottomSheet() {
    return showModalBottomSheet<int>(
        context: context,
        builder: (context) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return ListTile(
                  title: Text("点击下列列表项"),
                );
              }
              return ListTile(
                title: Text("$index"),
                onTap: () {
                  Navigator.of(context).pop(index);
                },
              );
            },
            shrinkWrap: true,
            itemCount: 40,
          );
        });
  }

  Future<bool> getLoadingDialog() {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text("正在加载..."),
                ),
              ],
            ),
          );
        });
  }

  Future<DateTime> getDataPicker() {
    var date = DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(Duration(days: 100)));
  }


}
