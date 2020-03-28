# Flutter学(cai)习(keng)之路(Flutter in Action)

## 主要get到的点

- [x] 路由管理
- [x] 状态管理
- [x] 基础控件
  - [x] 随机字符串
  - [x] 文本控件，字体样式
  - [x] 按钮系列
  - [x] 图片系列
  - [x] 单选开关和复选框
  - [x] 输入框和表单
  - [x] 登录表单
  - [x] 各种样式的进度条

## 坑の顺位: ↓

1. Waiting for another flutter command to release the startup lock...

   - 删除SDK中的flutter/bin/cache/lockfile文件

2. [pubspec.yaml修改后点击packages get后长时间无反应，提示: Running "flutter pub get" in flutter_app](https://blog.csdn.net/unique_Even/article/details/104995111)

3. XXX called with a context that does not contain a Scaffold...

   - 注意要在State中的body节点对应new一个Builder，且通过命名参数显式的传递一个上下文参数，否则就会报如上错误。

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
