import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class DecoratedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              child: Center(
                child: DecoratedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                    child: Text(
                      "绘制背景",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.blue]),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(5, 5),
                            blurRadius: 6)
                      ]),
                  position: DecorationPosition.background,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Center(
                child: DecoratedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                    child: Text(
                      "绘制前景",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.blue]),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(5, 5),
                            blurRadius: 6)
                      ]),
                  position: DecorationPosition.foreground,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
