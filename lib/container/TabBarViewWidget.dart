import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class TabBarViewWidget extends StatefulWidget {
  @override
  TabBarViewState createState() {
    // TODO: implement createState
    return TabBarViewState();
  }
}

class TabBarViewState extends State<TabBarViewWidget>
    with SingleTickerProviderStateMixin {
  var currentIndex = 0;
  var tabController;
  final tabs = [
    Text(
      "推荐",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    Text(
      "精选",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    Text(
      "视频",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    Text(
      "体育",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    Text(
      "教育",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    Text(
      "历史",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    Text(
      "科学",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    Text(
      "股票",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    Text(
      "军事",
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  ];

  final bottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.ondemand_video,
      ),
      title: Text("视频"),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.youtube_searched_for,
      ),
      title: Text("热榜"),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.video_call,
      ),
      title: Text("放映室"),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      title: Text("我的"),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      //顶部导航
      appBar: AppBar(
        title: Text("$arg"),
        actions: <Widget>[
          Builder(
            builder: (context) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    ScaffoldState scaffoldState =
                        context.findRootAncestorStateOfType<ScaffoldState>();
                    scaffoldState.showSnackBar(SnackBar(
                      content: Text("点击了搜索按钮"),
                    ));
                  });
            },
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  textDirection: TextDirection.ltr,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
        backgroundColor: Colors.redAccent,
        elevation: 5.0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.apps),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: tabs,
          controller: tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.all(10.0),
          labelStyle: TextStyle(fontWeight: FontWeight.w800),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: tabs.map((text) {
          if (currentIndex == 0) {
            return Container(
              child: Text(
                text.data,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: "HanyiSentySuciTablet",
                    fontSize: 50,
                    color: Colors.redAccent),
              ),
              alignment: Alignment.center,
            );
          } else {
            return Container();
          }
        }).toList(),
      ),
      //底部导航
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItem,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
      ),
      drawer: getDrawer("真相只有一个", true),
      endDrawer: getDrawer("同意左边说的", false),
    );
  }
}

Drawer getDrawer(String username, bool showItem) {
  return Drawer(
    child: Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          //头像用户名
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    "assets/images/conan.jpg",
                    width: 50,
                    height: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "$username",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          //分割线
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Divider(
              height: 10,
              color: Colors.grey,
            ),
          ),
          Builder(builder: (context) {
            final screenHeight = MediaQuery.of(context).size.height;
            //所有item用一个容器修饰
            return Container(
              width: showItem ? double.infinity : 0,
              height: showItem ? screenHeight / 3 * 2 : 0,
              child: Column(
                children: <Widget>[
                  //item1
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "item1",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  //item2
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "item2",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  //item3
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "item3",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  //item4
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "item4",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          //设置
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.settings,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "设置",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          //退出
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.exit_to_app,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "退出",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
