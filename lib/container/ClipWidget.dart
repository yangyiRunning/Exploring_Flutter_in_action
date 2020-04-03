import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    final img = Image.asset(
      "assets/images/conan.jpg",
      width: 100,
      height: 100,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              img,
              Container(
                margin: EdgeInsets.only(top: 30),
                child: ClipOval(
                  child: img,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: ClipRect(
                    child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.5,
                  child: img,
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: img,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: ClipRect(
                  child: img,
                  clipper: ExampleClipper(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTWH(0, 0, 50, 50);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}
