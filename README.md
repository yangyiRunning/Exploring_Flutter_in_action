# Flutter学(cai)习(keng)之路(Flutter learning in action)

---

## 创世宣言

- 尽情踩坑吧 ⤵️

## 主要Cover到的点

- [x] **路由界面**
- [x] **状态传递**
  - [x] [子Widget树获取父级StatefulWidget的State对象](lib/state/SnackBarWidget.dart)
- [x] **基础控件**
  - [x] [随机字符串(package:english_words/english_words.dart)](lib/widget/RandomWordWidget.dart)
  - [x] [文本控件，字体样式(Text/TextStyle/Text.rich/TextSpan)](lib/widget/TextStyleWidget.dart)
  - [x] [按钮系列(RaisedButton/FlatButton/OutlineButton/IconButton/FlatButton.icon/shape)](lib/widget/ButtonWidget.dart)
  - [x] [图片系列(ImageProvider/Image/Image.asset/Image.network)](lib/widget/SwitchCheckboxWidget.dart)
  - [x] [单选开关和复选框Switch/Checkbox](lib/widget/SwitchCheckboxWidget.dart)
  - [x] [输入框和表单(TextField/Form/TextFormField/FormState)](lib/widget/EditTextFormWidget.dart)
  - [x] [登录表单(TextField/Form/TextFormField/FormState)](lib/widget/LoginFormWidget.dart)
  - [x] [各种样式的进度条(LinearProgressIndicator/CircularProgressIndicator)](lib/widget/ProgressBarWidget.dart)
- [x] **布局控件**
  - [x] [线性布局(Row/Column)](lib/layout/LinearLayoutWidget.dart)
  - [x] [弹性布局(Flex/Expanded/Spacer)](lib/layout/FlexLayoutWidget.dart)
  - [x] [流式布局(Wrap/Flow)](lib/layout/WrapLayoutWidget.dart)
  - [x] [层叠布局(Stack/Positioned)](lib/layout/StackLayoutWidget.dart)
  - [x] [对齐与相对定位(Align/Alignment/FractionalOffset/Center)](lib/layout/AlignLayoutWidget.dart)
- [x] **容器控件**
  - [x] [填充(Padding/EdgeInsets)](lib/container/PaddingContainerWidget.dart)
  - [x] [尺寸限制(ConstrainedBox/BoxConstraints/SizedBox/UnconstrainedBox)](lib/container/BoxContainerWidget.dart)
  - [x] [装饰(DecoratedBox)](lib/container/DecoratedBoxWidget.dart)
  - [x] [变换(Transform/Matrix4(作用于绘制阶段)/RotatedBox(作用于布局阶段))](lib/container/TransformWidget.dart)
  - [x] [容器(Container(多种装饰和填充等组件的组合)/Padding/Margin)](lib/container/ContainerWidget.dart)
  - [x] [裁减(Clip/CustomClipper(裁减动作的作用时期与Transform相同，都作用于绘制阶段))](lib/container/ClipWidget.dart)
  - [x] [通用类导航主界面(Scaffold/AppBar/TabBar/TabBarView/Drawer/FloatingActionButton)](lib/container/TabBarViewWidget.dart)
- [x] **列表控件**
  - [x] 单child滚动控件(SingleChildScrollView/Scrollbar)
  - [x] [有限列表项情况下使用ListView(ListView)](lib/list/LimitListViewWidget.dart)
  - [x] [众多列表项情况下使用ListView(ListView.builder)](lib/list/MultitudinousListViewWidget.dart)
  - [x] [带分割线的列表项情况下使用ListView(ListView.separated)](lib/list/DividerListViewWidget.dart)
  - [x] [**下拉刷新** 和 **上拉加载更多**(初始化加载数据、结束时的标记、根据index判断底部是绘制结束的Widget还是正在加载时的Widget、Widget的正常显示)](lib/list/LoadingMordAndRefreshListViewWidget.dart)
  - [x] [有限GridView(GridView + SliverGridDelegateWithFixedCrossAxisCount)](lib/list/GridViewWidget.dart)
  - [x] [有限GridView.count(效果完全等价于GridView + SliverGridDelegateWithFixedCrossAxisCount)](lib/list/GridViewCountWidget.dart)
  - [x] [有限GridView(GridView + SliverGridDelegateWithMaxCrossAxisExtent)](lib/list/GridViewMaxExtendWidget.dart)
  - [x] [有限GridView.extent(效果完全等价于GridView + SliverGridDelegateWithMaxCrossAxisExtent)](lib/list/GridViewMaxExtendWidget.dart)
  - [x] [无限GridView加载(GridView.builder)](lib/list/UnLimitGridViewWidget.dart)
  - [x] [滚动监听(ScrollController/ScrollPosition)()](lib/list/ListViewScrollControllerWidget.dart)
- [x] **触摸反馈**
  - [x] 事件处理
    - [x] [原始指针(触摸事件)(撸一个触摸板)(Listener)](lib/touch/TouchPadWidget.dart)
  - [x] 事件冒泡
    - [x] [不同事件冒泡行为之比较(HitTestBehavior.deferToChild/HitTestBehavior.opaque/HitTestBehavior.translucent/IgnorePointer)](lib/touch/TouchBubbleWidget.dart)
  - [x] 手势识别
    - [x] [点击/双击/长按/拖动/滑动(GestureDetector)](lib/gesture/GestureDetectorWidget.dart)
    - [x] [缩放(GestureDetector)](lib/gesture/ScaleGestureDetectorWidget.dart)
    - [x] [GestureRecognizer(**当所修饰的对象不为widget且具有recognizer节点时可用**)](lib/gesture/GestureRecognizerTextWidget.dart)
- [x] **事件总线**
  - [x] [EventBus(Dart实现)](lib/event/EventBus.dart)
  - [x] [EventBus界面演示](lib/event/EventBusWidget.dart)
- [x] **通知**
  - [x] [通知事件名称(NotificationListener.onNotification)](lib/notification/ScrollNotificationWidget.dart)
- [ ] 动画
- [ ] 自定义控件
- [ ] 与原生互调
- [ ] 数据及状态共享
- [ ] 网络编程
- [ ] 多主题切换
- [ ] 国际化

---

## 正片(Action)

- 内含大量gif图，loading可能会比较耗时，依自身网速而定

| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdmryrmlz5j30u01t0abl.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnxwrxvofg30cg0qoe84.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnwx3p0emg30cg0qo4qr.gif) |  |
| :---:  | :---: | :---: | :---: |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnx6pbtaxg30ge0zkkjn.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnyrl9lq6g30ge0zk7wj.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnxss7yjig30ge0zkqv5.gif) |  |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnwrjitv5g30ge0zku0z.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdmsdeily1j30u01t078v.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms27cfs8j30u01t0mzn.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms2mvb8rj30u01t0tab.jpg) |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms2zmrnjj30u01t0my3.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms395nsuj30u01t0ad9.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms3s5dnaj30u01t0gq7.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms43few5j30u01t0n1o.jpg) |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms7mfimij30u01t0q4b.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms7x7kwkj30u01t0mxy.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdmsng1wahj30u01t0q5q.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms8mcoomj30u01t00ut.jpg) |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms8y1uxpj30u01t0whs.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdmsl8d4iej30u01t0grq.jpg) |  |  |

---

## 整套效果的App下载链接

| OS平台应用包 | QRCode |
| :---:  | :---: |
| Android APK包下载(内测密码:123456) | ![Android APK包下载](https://www.pgyer.com/app/qrcode/IHPE?sign=&auSign=&code=)
| iOS 包下载( 虚位以待 ) | |

---

## 坑の顺位: ↓

1. Waiting for another flutter command to release the startup lock...

  - 删除SDK中的flutter/bin/cache/lockfile文件

2. [pubspec.yaml修改后点击packages get后长时间无反应，提示: Running "flutter pub get" in flutter_app](https://blog.csdn.net/unique_Even/article/details/104995111)

3. XXX called with a context that does not contain a Scaffold...

  - 注意要在State中的body节点对应new一个Builder，且通过命名参数显式的传递一个上下文参数，否则就会报如上错误

  - 具体写法可参照代码: [https://stackoverflow.com/questions/51304568/scaffold-of-called-with-a-context-that-does-not-contain-a-scaffold](https://stackoverflow.com/questions/51304568/scaffold-of-called-with-a-context-that-does-not-contain-a-scaffold)

4. Failed assertion: line 25 pos 15: 'child != null': is not true...

  - 某个控件树下没有对应的设置child节点

5. 修改应用名称和应用logo无效...

  - 只修改main.dart文件中MaterialApp节点下的title是不行的，title不全等价于App在手机上的应用名。对应的还需要修改相应平台的名称: Android/iOS。
  - 原生平台的应用名称修改分别在android/app/src/main/AndroidManifest.xml和ios/Runner/Info.plist下
  - 同理，修改应用logo也遵循此原则

6. The method 'showSnackBar' was called on null...

  - 调用showSnackBar方法显示SnackBar时，往往是在与一个StatefulWidget对应的State类中调用
  - 在State对应的子类的body节点中，**需要new一个Builder并传递一个上下文**，通过上下文find到父类中对应的ScaffoldState对象，进而调用showSnackBar显示SnackBar
  - **否则，会出现没有对应的上下文对象所导致的NPL**

7. Positioned宽度width和高度height的计算...

  - width的计算会基于left和right进行， 当指定left和width后，right会自动算出(left+width)，如果同时指定width/left/right属性则会报错
  - height的计算会基于top和bottom进行，当指定top和height后，bottom会自动算出(top+height)，如果同时指定height/top/bottom属性则会报错
  
8. 在事件冒泡过程中
  - **深坑: 当给底部Container控件设置color后，任何behavior(opaque/translucent/deferToChild)将会失效**

9. Flutter如何更改App包名?
  ```
  1.) src/profile/AndroidManifest.xml
  2.) src/debug/AndroidManifest.xml
  3.) src/main/AdroidManifest.xml
  4.) build.gradle .
      defaultConfig {
      applicationId
  5.) MainActivity.java on "package"
  ```
  
---

## 最后我再叨叨两句

- 本人学(cai)习(keng)中的一些小体会(主观居多︿(￣︶￣)︿)
  - 先说Dart
    - Dart语言是基于Java、JavaScript的部分语法，还糅合了Kotlin的部分语法糖的一门语言，本身是融合的产物，估计Google的初衷是想"博采众长"
    - Dart语言本身比Java更加简练，也加入了一些Java中没有的语法糖。比如async和await，本质其实还是个Future
    - 对于已经习惯了Rx系列链式编程的人来说，Dart天然自带。如果觉得链式书写的"链"太长"影响市容"的话，还可以采用类似Kotlin中协程的写法非常舒服的书写异步任务，基本上在Dart语言中不会出现callback hell
    - 对于掌握上述任何一种语言的人来说，近乎可以以极小成本上手Dart
  - 再说Flutter
    - Flutter本质上其实算一个UI框架，一套代码到处跑。UI框架+原生引擎渲染
    - 一套优秀的Flutter代码，理论上可以在Android/iOS/Web/Fuchsia各种环境和操作系统上运行，并且保证UI界面的高度一致性
    - Flutter的数据结构体系，本质上与其他技术栈对于UI层控件的处理类似，都是一颗多叉树，创建并渲染UI的过程本质上就是建树和走树的过程
    - 在写Flutter的过程中，有时候甚至觉得自己不是在"写代码"，更像是在一棵"树"上画画
    - 对于有任何一端移动开发经验尤其是Android开发经验的同学来说，Flutter的上手门槛是0

---

###  巨人的肩膀: [Flutter官方示例](https://github.com/flutter/flutter)、[Flutter中文网](https://flutterchina.club)