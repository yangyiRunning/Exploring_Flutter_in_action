import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    final localImg = "assets/images/conan.jpg";
    final networkImg =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585073276237&di=7e595c59519294214d1b1e1d83a78b18&imgtype=0&src=http%3A%2F%2Fwww.17qq.com%2Fimg_qqtouxiang%2F76699903.jpeg";
    final double imgWidth = 80;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("从assets中加载图片: "),
                Image.asset(localImg, width: imgWidth)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("从网络加载图片: "),
                Image.network(
                  networkImg,
                  width: imgWidth,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("原图: "),
                Image.asset(localImg, width: imgWidth)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BoxFit.fill: "),
                Image.asset(
                  localImg,
                  width: imgWidth,
                  fit: BoxFit.fill, //会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BoxFit.cover: "),
                Image.asset(
                  localImg,
                  width: imgWidth,
                  fit: BoxFit.cover, //会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BoxFit.contain: "),
                Image.asset(
                  localImg,
                  width: imgWidth,
                  fit: BoxFit
                      .contain, //这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BoxFit.fitWidth: "),
                Image.asset(
                  localImg,
                  width: imgWidth,
                  fit: BoxFit
                      .fitWidth, //图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BoxFit.fitHeight: "),
                Image.asset(
                  localImg,
                  width: imgWidth,
                  fit: BoxFit
                      .fitHeight, //图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BoxFit.none: "),
                Image.asset(
                  localImg,
                  width: imgWidth,
                  fit: BoxFit
                      .none, //图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("颜色混合处理: "),
                Image.asset(localImg,
                    width: imgWidth,
                    color: Colors.blue,
                    colorBlendMode: BlendMode.difference)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("repeat: "),
                Image.asset(localImg,
                    width: imgWidth,
                    height: imgWidth * 4.5,
                    repeat: ImageRepeat.repeatY)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("显示字体图片"),
                    Text("即一串谜一样的字符文本，对应一张图片", textScaleFactor: 0.6)
                  ],
                ),
                Icon(Icons.settings,
                    color: Colors.red,
                    size: imgWidth,
                    textDirection: TextDirection.ltr)
              ],
            )
          ].map((f) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: imgWidth * 3,
                    child: f,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
