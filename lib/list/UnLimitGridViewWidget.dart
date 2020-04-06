import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class UnLimitGridViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UnLimitGridViewState();
  }
}

class UnLimitGridViewState extends State<UnLimitGridViewWidget> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              "GridView.builder",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "HanyiSentySuciTablet",
                  color: Colors.blue),
            ),
          ),
          Expanded(child: Builder(
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
                  //启用sliver延迟加载机制
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      //到底了就加载，无限加载，不管加载多少
                      if (index == words.length - 1) {
                        retrieveData();
                      }
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
                    },
                    shrinkWrap: true,
                    itemCount: words.length,
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
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

  @override
  void initState() {
    super.initState();
    retrieveData();
  }
}
