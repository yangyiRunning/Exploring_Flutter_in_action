import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    const textStyle =
        TextStyle(fontFamily: "HanyiSentySuciTablet", fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "左对齐的文本。",
              textAlign: TextAlign.start,
            ),
            Text("长度超过一行，超出省略号的文本。" * 100,
                maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(
              "相较于默认放大2倍的文本。",
              textScaleFactor: 2,
            ),
            Text(
              "长字符串。" * 9,
              textAlign: TextAlign.center,
            ),
            //fontSize可以精确指定字体大小，而textScaleFactor只能通过缩放比例来控制。
            //textScaleFactor主要是用于系统字体大小设置改变时对Flutter应用字体进行全局调整，而fontSize通常用于单个文本，字体大小不会跟随系统字体大小变化。
            Text(
              "带style的文本",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                  height: 2,
                  //此处的height不是具体的高度值，而是一个因子，具体的高度值为fontSize*height
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.black,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.yellow,
                  decorationStyle: TextDecorationStyle.wavy),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "富文本的显示:"),
              TextSpan(text: "红色", style: TextStyle(color: Colors.red)),
              TextSpan(text: "黄色", style: TextStyle(color: Colors.yellow)),
              TextSpan(
                text: "蓝色带点击事件",
                style: TextStyle(
                  inherit: false, //不继承默认样式
                  color: Colors.blue,
                ),
//                  recognizer:
              ),
            ])),
            Text(
                "怒发冲冠，凭阑处、潇潇雨歇。抬望眼，仰天长啸，壮怀激烈。三十功名尘与土，八千里路云和月。莫等闲、白了少年头，空悲切。靖康耻，犹未雪；臣子恨，何时灭！驾长车、踏破贺阑山缺。壮志饥餐胡虏肉，笑谈渴饮匈奴血。待从头、收拾旧山河，朝天阙。",
                style: textStyle),
            Text(
              "——宋·岳飞",
              style: TextStyle(fontFamily: "HanyiSentySuciTablet", fontSize: 30)//也可以不用声明直接在此处new
            )
          ],
        ),
      ),
    );
  }
}
