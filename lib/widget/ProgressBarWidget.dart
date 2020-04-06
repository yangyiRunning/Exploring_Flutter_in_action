import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class ProgressBarWidget extends StatefulWidget {
  @override
  ProgressBarState createState() {
    // TODO: implement createState
    return ProgressBarState();
  }
}

class ProgressBarState extends State<ProgressBarWidget> {
  double initProgressValue = 0.2;
  double initCircularProgressValue = 0.2;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("$arg"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Text("矩形的模糊的进度条"),
                LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  backgroundColor: Colors.grey,
                  value: null,
                ),
                SizedBox(
                  height: 30,
                ),
                Text("矩形的精确的进度条"),
                LinearProgressIndicator(
                  value: initProgressValue,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  backgroundColor: Colors.grey,
                ),
                RaisedButton(
                  child: Text("点击更新进度条"),
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
                    setState(() {
                      if (initProgressValue == 1) {
                        initProgressValue = 0;
                      }
                      initProgressValue += 0.2;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text("圆形的模糊的进度条"),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: null,
                  backgroundColor: Colors.grey,
                  strokeWidth: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                Text("圆形的精确进度条"),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: initCircularProgressValue,
                  backgroundColor: Colors.grey,
                  strokeWidth: 5,
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  child: Text("点击更新进度条"),
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
                    setState(() {
                      if (initCircularProgressValue == 1) {
                        initCircularProgressValue = 0;
                      }
                      initCircularProgressValue += 0.2;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text("自定义大小的矩形进度条"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  height: 3,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    backgroundColor: Colors.grey,
                    value: null,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("自定义大小的圆形进度条"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      value: null,
                      backgroundColor: Colors.grey,
                    ))
              ],
            ),
          ),
        ));
  }
}
