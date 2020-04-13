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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: new Container(
        alignment: Alignment.center,
        child: FutureBuilder(
            future: getGithubRepositories(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return getListView(response);
              }
              //请求未完成时弹出loading
              return CircularProgressIndicator();
            }),
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
          .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
          .toList(),
    );
  }
}
