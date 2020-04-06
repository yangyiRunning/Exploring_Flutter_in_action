import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class LoadingMordAndRefreshListViewWidget extends StatefulWidget {
  @override
  LoadingMordAndRefreshListViewState createState() {
    // TODO: implement createState
    return LoadingMordAndRefreshListViewState();
  }
}

class LoadingMordAndRefreshListViewState
    extends State<LoadingMordAndRefreshListViewWidget> {
  static const LOADING_FINISH = "loading_finish";
  var words = [LOADING_FINISH]; //随机生成的单词倒着往回追加

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: SizedBox(
              //头部展示位宽度为屏幕宽度
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Center(
                child: Text(
                  "下拉刷新和上拉加载更多",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "HanyiSentySuciTablet",
                      color: Colors.blue),
                ),
              ),
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                return RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: 2)).then((v) {
                      words = [LOADING_FINISH];
                      setState(() {});
                    }).whenComplete(() {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "刷新完毕",
                          style: TextStyle(color: Colors.blue),
                        ),
                        backgroundColor: Colors.grey[300],
                      ));
                    });
                  },
                  child: Scrollbar(
                    child: ListView.separated(
                        //当子组件太短而不能滚动的时候，需要添加physics: const AlwaysScrollableScrollPhysics(),否则下拉刷新和上拉加载更多都无效，无法触发了
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          if (words[index] == LOADING_FINISH) {
                            if (index < 100) {
                              retrieveData();
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 50),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 5, 10),
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.grey,
                                        strokeWidth: 3,
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 10, 10, 10),
                                      child: Text(
                                        "正在加载中...",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                alignment: Alignment.center,
                                child: Text("已经到底了 o(╯□╰)o",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 50),
                              );
                            }
                          } else {
                            return ListTile(
                              leading: Image.asset("assets/images/conan.jpg"),
                              title: Text("item $index"),
                              subtitle: Text("subtitle $index"),
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              onTap: () {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("点击了第 ($index) 项目"),
                                ));
                              },
                              onLongPress: () {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("长按了第 ($index) 项目"),
                                ));
                              },
                            );
                          }
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
                        itemCount: words.length),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  void retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      words.insertAll(
          words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }
}
