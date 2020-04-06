import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShow.dart';

class ListManagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    var count = getFlatButtonList(context).length;
    return Scaffold(
        appBar: AppBar(
          title: Text("$arg"),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return getFlatButtonList(context)[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Divider(
                        height: 10,
                        color: Colors.blue,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Divider(
                        height: 10,
                        color: Colors.redAccent,
                      ),
                    );
            },
            itemCount: count));
  }
}

List<FlatButton> getFlatButtonList(BuildContext context) {
  List<FlatButton> flatButtonList = [];
  flatButtonList.add(getFlatButton(context, "有限列表项情况下使用ListView",
      "LimitListViewWidget", "有限列表项情况下使用ListView"));
  flatButtonList.add(getFlatButton(context, "众多列表项情况下使用ListView",
      "MultitudinousListViewWidget", "众多列表项情况下使用ListView"));
  flatButtonList.add(getFlatButton(context, "有分割线列表项情况下使用ListView",
      "DividerListViewWidget", "有分割线列表项情况下使用ListView"));
  flatButtonList.add(getFlatButton(context, "下拉刷新和上拉加载更多",
      "LoadingMordAndRefreshListViewWidget", "下拉刷新和上拉加载更多"));
  flatButtonList
      .add(getFlatButton(context, "网格布局", "GridViewWidget", "网格布局界面"));
  return flatButtonList;
}
