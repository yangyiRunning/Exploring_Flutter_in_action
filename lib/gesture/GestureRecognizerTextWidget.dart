import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class GestureRecognizerTextWidget extends StatefulWidget {
  @override
  GestureRecognizerTextState createState() {
    // TODO: implement createState
    return GestureRecognizerTextState();
  }
}

class GestureRecognizerTextState extends State<GestureRecognizerTextWidget> {
  TapGestureRecognizer tapGestureRecognizer2 = new TapGestureRecognizer();
  TapGestureRecognizer tapGestureRecognizer3 = new TapGestureRecognizer();
  TapGestureRecognizer tapGestureRecognizer4 = new TapGestureRecognizer();
  TapGestureRecognizer tapGestureRecognizer5 = new TapGestureRecognizer();
  bool isGrey = false;
  bool isBeautiful = false;
  bool isBig = false;
  bool isBold = false;

  @override
  void dispose() {
    super.dispose();
    tapGestureRecognizer2.dispose();
    tapGestureRecognizer3.dispose();
    tapGestureRecognizer4.dispose();
    tapGestureRecognizer5.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //因为TextSpan不是widget，所以不能直接使用GestureDetector去包装这个child
          //但是其有recognizer节点，故可以尽情的设置Flutter提供的一系列GestureRecognizer实现
          child: Wrap(
            children: <Widget>[
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "原始",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                      text: "点击变粗",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: isBold ? FontWeight.w900 : FontWeight.w100,
                      ),
                      //..语法为级联操作，允许对同一个对象进行一系列操作
                      recognizer: tapGestureRecognizer2
                        ..onTap = () {
                          setState(() {
                            isBold = !isBold;
                          });
                        }),
                  TextSpan(
                      text: "点击变大",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: isBig ? 48 : 20,
                      ),
                      recognizer: tapGestureRecognizer3
                        ..onTap = () {
                          setState(() {
                            isBig = !isBig;
                          });
                        }),
                  TextSpan(
                      text: "点击变美",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontFamily: isBeautiful ? "HanyiSentySuciTablet" : "",
                      ),
                      recognizer: tapGestureRecognizer4
                        ..onTap = () {
                          setState(() {
                            isBeautiful = !isBeautiful;
                          });
                        }),
                  TextSpan(
                      text: "置灰",
                      style: TextStyle(
                        fontSize: 20,
                        color: isGrey ? Colors.blue : Colors.grey,
                      ),
                      recognizer: tapGestureRecognizer5
                        ..onTap = () {
                          setState(() {
                            isGrey = !isGrey;
                          });
                        })
                ],
              )),
            ],
          )),
    );
  }
}
