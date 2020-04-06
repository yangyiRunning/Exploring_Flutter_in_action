import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///author: yang yi
///email: yangyirunning@163.com
class RandomWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text("随机显示一串英文字符串"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Text(wordPair.toString()),
              Column(
                children: <Widget>[Image.asset("assets/ic_mario.png")],
              )
            ],
          )),
    );
  }
}
