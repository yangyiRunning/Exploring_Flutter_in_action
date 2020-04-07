import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowWrapper.dart';

class ListViewScrollControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewScrollControllerState();
  }
}

class ListViewScrollControllerState
    extends State<ListViewScrollControllerWidget> {
  var isShowFAB = false;
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return Container(
                alignment: Alignment.center,
                color: Colors.blueAccent[100],
                child: getLimitListWidget(100)[index],
              );
            } else {
              return Container(
                alignment: Alignment.center,
                color: Colors.orange[200],
                child: getLimitListWidget(100)[index],
              );
            }
          },
          itemCount: getLimitListWidget(100).length,
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          controller: scrollController,
        ),
      ),
      floatingActionButton: isShowFAB ? goTop() : null,
    );
  }


  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //滚动的偏移量
      print(scrollController.offset);
      if (scrollController.offset < 500 && isShowFAB) {
        setState(() {
          isShowFAB = false;
        });
      }
      if (scrollController.offset >= 500 && isShowFAB == false) {
        setState(() {
          isShowFAB = true;
        });
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  FloatingActionButton goTop() {
    return FloatingActionButton(
      child: Icon(Icons.vertical_align_top),
      backgroundColor: Colors.red[200],
      onPressed: () {
        scrollController.animateTo(
            0, duration: Duration(seconds: 1), curve: Curves.ease);
      },
    );
  }
}


