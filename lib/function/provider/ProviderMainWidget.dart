import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';
import 'package:flutter_app/function/provider/Person.dart';

import 'ChangeNotifierProvider.dart';
import 'InheritedProvider.dart';
import 'PersonChangeNotifier.dart';

///author: yang yi
///email: yangyirunning@163.com
///展示Provider
class ProviderMainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProviderMainState();
  }
}

class ProviderMainState extends State<ProviderMainWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      //ChangeNotifierProvider放在根部保证所有的子孙节点都可以拿到provider中保存的数据
      body: ChangeNotifierProvider<PersonChangeNotifier>(
        //M层数据变化后会通知Provider，Provider内部会通过InheritedWidget对其子孙控件进行重新绘制
        data: PersonChangeNotifier(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                print("build按钮");
                return RaisedButton(
                  child: Text("点击按钮添加一个人"),
                  onPressed: () {
                    //避免按钮每次都做不必要的绘制，故isDependOn设为false，默认isDependOn为true
                    ChangeNotifierProvider.getDependOnProvider<
                            PersonChangeNotifier>(context, isDependOn: false)
                        .data
                        .add(Person("王小二", 10, "男"));
                  },
                );
              },
            ),
            Expanded(
              child: Builder(builder: (BuildContext context) {
                InheritedProvider<PersonChangeNotifier> personChangeNotifier =
                    ChangeNotifierProvider.getDependOnProvider<
                        PersonChangeNotifier>(context);
                var name = personChangeNotifier.data.getName();
                print("name: $name");
                return Container(
                  color: Colors.blue[100],
                  alignment: Alignment.center,
                  child: Text("欢迎新伙伴 $name 加入"),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
