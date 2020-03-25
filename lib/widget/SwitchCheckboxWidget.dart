import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchCheckboxWidget extends StatefulWidget {
  @override
  SwitchCheckboxState createState() {
    // TODO: implement createState
    return SwitchCheckboxState();
  }
}

class SwitchCheckboxState extends State<SwitchCheckboxWidget> {
  bool switchValue = false; //单选switch初试状态为不选中
  bool checkboxValue = false; //复选框checkbox初试状态为不选中
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("$arg")),
      body: Center(
        child: Column(
          children: <Widget>[
            //单选开关Switch和复选框Checkbox本身不会保存当前选中状态，选中状态由父控件来管理
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("单选开关: "),
                Switch(
                  value: switchValue,
                  activeColor: Colors.blue,
                  onChanged: (bool value) {
                    print(value);
                    setState(() {
                      switchValue = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("复选框: "),
                Checkbox(
                  value: checkboxValue,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    print(value);
                    setState(() {
                      checkboxValue = value;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
