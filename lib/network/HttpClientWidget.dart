import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

///author: yang yi
///email: yangyirunning@163.com
class HttpClientWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HttpClientState();
  }
}

class HttpClientState extends State<HttpClientWidget> {
  TextEditingController textEditingController = new TextEditingController();
  String responseContent = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: getAppBar(arg),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  color: Colors.grey[100],
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text("https://"),
                            Expanded(
                              child: TextField(
                                autofocus: false,
                                style: TextStyle(color: Colors.blue),
                                textAlign: TextAlign.center,
                                controller: textEditingController,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.web),
                                    hintText: "这里输入网址",
                                    border: InputBorder.none),
                                onEditingComplete: () {
                                  loadWeb();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: RaisedButton(
                                  color: Colors.blue,
                                  highlightColor: Colors.blue[700],
                                  colorBrightness: Brightness.dark,
                                  splashColor: Colors.grey,
                                  child: Text("发送网络请求"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  //正常状态下的阴影
                                  elevation: 2.0,
                                  //按下时的阴影
                                  highlightElevation: 8.0,
                                  // 禁用时的阴影
                                  disabledElevation: 0.0,
                                  onPressed: () {
                                    loadWeb();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: RaisedButton(
                                  color: Colors.blue,
                                  highlightColor: Colors.blue[700],
                                  colorBrightness: Brightness.dark,
                                  splashColor: Colors.grey,
                                  child: Text("清空响应报文"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  //正常状态下的阴影
                                  elevation: 2.0,
                                  //按下时的阴影
                                  highlightElevation: 8.0,
                                  // 禁用时的阴影
                                  disabledElevation: 0.0,
                                  onPressed: () {
                                    setState(() {
                                      responseContent = "";
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Divider(
              height: 5,
              color: Colors.grey,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                color: Colors.blue[100],
                child: SingleChildScrollView(
                  child: Text(
                    responseContent,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                    ),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
            ),
          ],
        ));
  }

  void loadWeb() async {
    try {
      HttpClient httpClient = new HttpClient();
      String editContent = textEditingController.text;
      HttpClientRequest httpClientRequest =
          await httpClient.getUrl(Uri.parse("https://$editContent"));
      httpClientRequest.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      HttpClientResponse response = await httpClientRequest.close();
      String responseString = await response.transform(utf8.decoder).join();
      setState(() {
        responseContent = response.headers.toString();
        responseContent += "\n";
        responseContent += "\n";
        responseContent += responseString;
      });
      httpClient.close();
    } catch (e) {
      setState(() {
        responseContent = e.toString();
      });
    }
  }
}
