![封面](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtq1mr0xnj315o0dwt9y.jpg)

# Flutter学(cai)习(keng)之路(Exploring Flutter in action)

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
  - [x] [滚动监听(ScrollController/ScrollPosition)](lib/list/ListViewScrollControllerWidget.dart)
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
  - [x] [简易EventBus(Dart实现)](lib/event/EventBus.dart)
  - [x] [EventBus界面演示](lib/event/EventBusWidget.dart)
- [x] **通知**
  - [x] [通知事件名称(NotificationListener.onNotification)](lib/notification/ScrollNotificationWidget.dart)
  - [x] [自定义通知(覆写Notification + NotificationListener<T>)](lib/notification/CustomScrollNotificationWidget.dart)
  - [x] [通知冒泡(onNotification回调中的return value)](/lib/notification/NotificationBubblingWidget.dart)
- [x] **存储路径访问和文件操作**
  - [x] [存储路径访问(访问缓存/访问包路径/访问SD卡)(PathProvider)](lib/io/FileIOWidget.dart)
- [x] **网络编程**
  - [x] [HttpClient](lib/network/HttpClientWidget.dart)
  - [x] [Dio(本质是基于HttpClient封装的上层API)](lib/network/DioWidget.dart)
    - [更多Dio版本信息及API(官方地址)](https://github.com/flutterchina/dio/blob/master/README.md)
- [x] **功能控件及数据状态管理(InheritedWidget)**
  - [x] [导航返回键和实体返回键拦截(再按一次确认退出)(WillPopScope)](lib/function/CheckExitWidget.dart)
  - [x] [**控件跨级传递数据(InheritedWidget/dependOnInheritedWidgetOfExactType/getElementForInheritedWidgetOfExactType/updateShouldNotify/didChangeDependencies)**](lib/function/ShareDataInheritedWidget.dart)
  - [x] [**跨控件状态管理(手动实现Provider)**](lib/function/provider/ProviderMainWidget.dart)
    - [第三方Provider实现](https://pub.flutter-io.cn/packages/provider)
  - [x] [异步更新UI(FutureBuilder/StreamBuilder)](lib/network/DioWidget.dart)
- [x] **应用主题切换(Theme/ThemeData(内部通过InheritedWidget实现))**
  - [x] [单个界面主题切换](lib/theme/LocalThemeSwitchWidget.dart)
  - [x] [全局界面主题切换]()
- [ ] 动画
- [ ] 自定义控件
- [ ] 与原生互调
- [ ] 国际化

---

## 正片(Action)

- 内含大量gif图，loading可能会比较耗时，依自身网速而定

| ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtr46y9rzg30ge0zkq88.gif) | ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtrq2sdtsg30ge0zkqv6.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnxwrxvofg30cg0qoe84.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnwx3p0emg30cg0qo4qr.gif) |
| :---:  | :---: | :---: | :---: |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnx6pbtaxg30ge0zkkjn.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnyrl9lq6g30ge0zk7wj.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnxss7yjig30ge0zkqv5.gif) | ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqhhsnr9g30ge0zkn55.gif) |
| ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqmyo0f5g30ge0zkh0s.gif) | ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqvquwjng30ge0zkn1b.gif) |  |  |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdnwrjitv5g30ge0zku0z.gif) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdmsdeily1j30u01t078v.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms27cfs8j30u01t0mzn.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms2mvb8rj30u01t0tab.jpg) |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms2zmrnjj30u01t0my3.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms395nsuj30u01t0ad9.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms3s5dnaj30u01t0gq7.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms43few5j30u01t0n1o.jpg) |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms7mfimij30u01t0q4b.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms7x7kwkj30u01t0mxy.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdmsng1wahj30u01t0q5q.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms8mcoomj30u01t00ut.jpg) |
| ![](https://tva1.sinaimg.cn/large/00831rSTly1gdms8y1uxpj30u01t0whs.jpg) | ![](https://tva1.sinaimg.cn/large/00831rSTly1gdmsl8d4iej30u01t0grq.jpg) | ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqcr95jxj30u01t00xv.jpg) | ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqdhi8v1j30u01t0q5m.jpg) |
| ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqiauwj1j30u01t00tk.jpg) | ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqio5susj30u01t0mya.jpg) | ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqjfc5elj30u01t041e.jpg) | ![](https://tva1.sinaimg.cn/large/007S8ZIlly1gdtqqjjxmxj30u01t0ta6.jpg) |

---

## 整套效果的App下载链接

### for Android

| OS平台应用包 | QRCode |
| :---:  | :---: |
| [Android APK包下载(内测密码:123456)](https://www.pgyer.com/IHPE) | ![Android APK包下载](https://www.pgyer.com/app/qrcode/IHPE?sign=&auSign=&code=)

### for iOS

| OS平台应用包 | QRCode |
| :---:  | :---: |
| iOS 包下载( 虚位以待 ) | |

### for Web

- web地址: 虚位以待

---

## 坑の顺位: ↓

1. Waiting for another flutter command to release the startup lock...
- 因为已经有一个Flutter命令正在运行，删除SDK中的flutter/bin/cache/lockfile文件重新运行即可

2. [pubspec.yaml修改后点击packages get后长时间无反应，提示: Running "flutter pub get" in flutter_app](https://blog.csdn.net/unique_Even/article/details/104995111)
- 因为GFW的封锁，强烈建议使用国内高校镜像网站: [清华大学开源软件镜像站](https://mirror.tuna.tsinghua.edu.cn/help/dart-pub/)

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

10. Flutter更改versionCode及versionName
- [pubspec.yaml](pubspec.yaml)文件中默认有version:
  1.0.0+1，其中+之前的"1.0.0"对应versionName，+后边的"1"对应versionCode.

11. 打release包
- [Android release包](https://flutterchina.club/android-release/)

12. Flutter command not found
- 打开终端
- open .bash_profile
- export PATH=${PATH}:**/Users/yangyi/developer/flutter**/bin:$PATH
- 上述加粗部分为你的Flutter SDK路径
- 保存
  
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