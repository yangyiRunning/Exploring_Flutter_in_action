import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class SettingWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingState();
  }
}

class SettingState extends State<SettingWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "开启布局边界",
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              Switch(
                value: isDebugPaintSizeEnabled,
                onChanged: (b) {
                  setState(() {
                    isDebugPaintSizeEnabled = !isDebugPaintSizeEnabled;
                    debugPaintSizeEnabled = isDebugPaintSizeEnabled;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
