import 'package:shared_preferences/shared_preferences.dart';

/// author: yang yi
/// email: yangyirunning@163.com
String isDebugShowMaterialGridKey;

Future<SharedPreferences> getSharedPreferences() async{
  var spFuture = await SharedPreferences.getInstance();
  return spFuture;
}