import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/common/CommonShowModel.dart';

class DioWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DioState();
  }
}

class DioState extends State<DioWidget> {
  Dio dio = new Dio();
  final TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.grey[850]);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Column(
        children: <Widget>[
          Expanded(
            child: new Container(
              color: Colors.amberAccent[100],
              alignment: Alignment.center,
              child: FutureBuilder(
                  future: getGithubRepositories(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //请求完毕
                    if (snapshot.connectionState == ConnectionState.done) {
                      Response response = snapshot.data;
                      if (snapshot.hasError) {
                        //请求发生错误
                        print(snapshot.error.toString());
                        return Text(snapshot.error.toString());
                      } else {
                        //请求成功
                        print(snapshot.data.toString());
                        return getListView(response);
                      }
                    } else {
                      //请求未完成时弹出loading
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ),
          Expanded(
            child: new Container(
              color: Colors.blue[100],
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Text(
                    "这是一个秒表: ",
                    style: textStyle,
                  ),
                  StreamBuilder(
                      stream: getCounter(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        //请求完毕
                        if (snapshot.connectionState == ConnectionState.none) {
                          return Text(
                            "当前没有异步任务，比如[FutureBuilder]的[future]为null时",
                            style: textStyle,
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text(
                            "异步任务处于等待状态",
                            style: textStyle,
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.active) {
                          print(
                              "Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态");
                          return Text(
                            "${snapshot.data}",
                            style: textStyle,
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return Text(
                            "异步任务已经终止",
                            style: textStyle,
                          );
                        }
                        return Text("");
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Response> getGithubRepositories() async {
    Response response = await dio.get("https://api.github.com/repositories");
    print(response.data.toString());
    return response;
  }

  ListView getListView(Response response) {
    return ListView(
      children: response.data
          .map<Widget>((e) => ListTile(
                  title: Text(
                e["full_name"],
                style: textStyle,
              )))
          .toList(),
    );
  }

  Stream<int> getCounter() {
    //周期定时器
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
}
