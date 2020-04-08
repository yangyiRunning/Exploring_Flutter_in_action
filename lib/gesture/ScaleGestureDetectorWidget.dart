import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class ScaleGestureDetectorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScaleGestureDetectorState();
  }
}

class ScaleGestureDetectorState extends State<ScaleGestureDetectorWidget> {
  double width = 100;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: GestureDetector(
          child: ClipOval(
            child: Image.asset(
              "assets/images/conan.jpg",
              width: width,
              height: height,
            ),
          ),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              width *= details.scale.clamp(0, double.infinity);
              height *= details.scale.clamp(0, double.infinity);
            });
          },
        ),
      ),
    );
  }
}
