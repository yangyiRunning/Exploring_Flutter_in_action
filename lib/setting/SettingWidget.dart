import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
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
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          Container(
            child: RaisedButton(
              child: Text("调用原生方法获取当前设备信息"),
              onPressed: () {
                getBatteryLevel();
                getSystemVersion();
                getSystemLanguage();
                getSystemLanguageList();
                getSystemModel();
                getDeviceBrand();
                getDeviceBoard();
                getSystemDevice();
                getDeviceManufacturer();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(batteryLevel),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(systemVersion),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(systemLanguage),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(systemLanguageList),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(systemModel),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(systemDevice),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(deviceBrand),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(deviceBoard),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: getCenterText(deviceManufacturer),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          Container(
            child: RaisedButton(
              child: Text("跳转至一个原生Android界面"),
              onPressed: () {
                goToAndroidAboutActivity();
              },
            ),
          ),
        ],
      ),
    );
  }

  static const methodChannel =
      const MethodChannel('com.exploring.flutter/device');
  String batteryLevel = "电池量";
  String systemVersion = "手机系统版本号";
  String systemLanguage = "手机系统语言";
  String systemLanguageList = "手机系统语言列表";
  String systemModel = "手机型号";
  String systemDevice = "手机设备名";
  String deviceBrand = "系统厂商";
  String deviceBoard = "手机主板";
  String deviceManufacturer = "手机厂商";

  Future<Null> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod("getBatteryLevel");
      batteryLevel = "电量为$result";
    } on PlatformException catch (e) {
      batteryLevel = "获取电量失败'${e.message}'";
    }
    setState(() {
      this.batteryLevel = batteryLevel;
    });
  }

  Future<Null> getSystemVersion() async {
    String systemVersion;
    try {
      final String result =
          await methodChannel.invokeMethod("getSystemVersion");
      systemVersion = "手机系统版本号为$result";
    } on PlatformException catch (e) {
      systemVersion = "获取手机系统版本号失败'${e.message}'";
    }
    setState(() {
      this.systemVersion = systemVersion;
    });
  }

  Future<Null> getSystemLanguage() async {
    String systemLanguage;
    try {
      final String result =
          await methodChannel.invokeMethod("getSystemLanguage");
      systemLanguage = "手机系统语言$result";
    } on PlatformException catch (e) {
      systemLanguage = "获取手机系统语言失败'${e.message}'";
    }
    setState(() {
      this.systemLanguage = systemLanguage;
    });
  }

  Future<Null> getSystemLanguageList() async {
    String systemLanguageList;
    try {
      final result = await methodChannel.invokeMethod("getSystemLanguageList");
      systemLanguageList = "手机系统语言列表$result";
    } on PlatformException catch (e) {
      systemLanguageList = "获取手机系统语言列表失败'${e.message}'";
    }
    setState(() {
      this.systemLanguageList = systemLanguageList;
    });
  }

  Future<Null> getSystemModel() async {
    String systemModel;
    try {
      final String result = await methodChannel.invokeMethod("getSystemModel");
      systemModel = "手机型号$result";
    } on PlatformException catch (e) {
      systemModel = "获取手机型号失败'${e.message}'";
    }
    setState(() {
      this.systemModel = systemModel;
    });
  }

  Future<Null> getDeviceBrand() async {
    String deviceBrand;
    try {
      final String result = await methodChannel.invokeMethod("getDeviceBrand");
      deviceBrand = "系统厂商名$result";
    } on PlatformException catch (e) {
      deviceBrand = "获取系统厂商名失败'${e.message}'";
    }
    setState(() {
      this.deviceBrand = deviceBrand;
    });
  }

  Future<Null> getDeviceBoard() async {
    String deviceBoard;
    try {
      final String result = await methodChannel.invokeMethod("getDeviceBoard");
      deviceBoard = "手机主板名$result";
    } on PlatformException catch (e) {
      deviceBoard = "获取手机主板名失败'${e.message}'";
    }
    setState(() {
      this.deviceBoard = deviceBoard;
    });
  }

  Future<Null> getDeviceManufacturer() async {
    String deviceManufacturer;
    try {
      final String result =
          await methodChannel.invokeMethod("getDeviceManufacturer");
      deviceManufacturer = "手机厂商名$result";
    } on PlatformException catch (e) {
      deviceManufacturer = "获取手机厂商名失败'${e.message}'";
    }
    setState(() {
      this.deviceManufacturer = deviceManufacturer;
    });
  }

  Future<Null> getSystemDevice() async {
    String systemDevice;
    try {
      final String result = await methodChannel.invokeMethod("getSystemDevice");
      systemDevice = "手机设备名$result";
    } on PlatformException catch (e) {
      systemDevice = "获取手机设备名失败'${e.message}'";
    }
    setState(() {
      this.systemDevice = systemDevice;
    });
  }

  void goToAndroidAboutActivity() {
    methodChannel.invokeMethod("goToAndroidAboutActivity");
  }
}
