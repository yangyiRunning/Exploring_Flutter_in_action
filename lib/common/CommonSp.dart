import 'package:shared_preferences/shared_preferences.dart';

String isDebugShowMaterialGridKey;

Future<SharedPreferences> getSharedPreferences() async{
  var spFuture = await SharedPreferences.getInstance();
  return spFuture;
}