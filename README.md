# Flutter学(cai)习(keng)之路(Flutter in Action)

## 正片前叨叨两句

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

## 主要Cover到的点

- [x] 路由界面
- [x] 状态传递
- [x] 基础控件
  - [x] 随机字符串
  - [x] 文本控件，字体样式
  - [x] 按钮系列
  - [x] 图片系列
  - [x] 单选开关和复选框
  - [x] 输入框和表单
  - [x] 登录表单
  - [x] 各种样式的进度条
- [x] 布局控件
  - [x] 线性布局
  - [x] 弹性布局(Flex/Expanded/Spacer)
  - [x] 流式布局(Wrap/Flow)
  - [x] 层叠布局(Stack/Positioned)
  - [x] 对齐与相对定位(Align/Alignment/FractionalOffset/Center)
- [x] 容器控件
  - [x] 填充(Padding/EdgeInsets)
  - [x] 尺寸限制(ConstrainedBox/BoxConstraints/SizedBox/UnconstrainedBox)
  - [x] 装饰(DecoratedBox)
  - [x] 变换(Transform/Matrix4(作用于绘制阶段)/RotatedBox(作用于布局阶段))
  - [x] 容器(Container(多种装饰和填充等组件的组合)/Padding/Margin)
  - [x] 裁减(Clip/CustomClipper(裁减动作的作用时期与Transform相同，都作用于绘制阶段))
  - [x] 通用类导航主界面(Scaffold/AppBar/TabBar/TabBarView/Drawer/FloatingActionButton)
- [x] 列表控件
  - [x] 单child滚动控件(SingleChildScrollView/Scrollbar)
  - [x] 有限列表项情况下使用ListView(ListView)
  - [x] 众多列表项情况下使用ListView(ListView.builder)
  - [x] 带分割线的列表项情况下使用ListView(ListView.separated)
  - [x] **下拉刷新** 和 **上拉加载更多**(初始化加载数据、结束时的标记、根据index判断底部是绘制结束的Widget还是正在加载时的Widget、Widget的正常显示)
  - [x] [有限GridView(GridView + SliverGridDelegateWithFixedCrossAxisCount)](lib/list/GridViewWidget.dart)
  - [x] [有限GridView.count(效果完全等价于GridView + SliverGridDelegateWithFixedCrossAxisCount)](lib/list/GridViewCountWidget.dart)
  - [x] [有限GridView(GridView + SliverGridDelegateWithMaxCrossAxisExtent)](lib/list/GridViewMaxExtendWidget.dart)
  - [x] [有限GridView.extent(效果完全等价于GridView + SliverGridDelegateWithMaxCrossAxisExtent)](lib/list/GridViewMaxExtendWidget.dart)
  - [x] [无限加载(GridView.builder)](lib/list/UnLimitGridViewWidget.dart)

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
  
---

巨人的肩膀: [Flutter官方示例](https://github.com/flutter/flutter)、[Flutter中文网](https://flutterchina.club)