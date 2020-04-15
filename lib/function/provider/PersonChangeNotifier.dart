import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/function/provider/Person.dart';

///author: yang yi
///email: yangyirunning@163.com
/// 用于填充Provider中泛型的具体类
class PersonChangeNotifier extends ChangeNotifier {
  List<Person> persons = [];
  String name = "";

  UnmodifiableListView<Person> get personList => UnmodifiableListView(persons);

  String getName() {
    for (var value in persons) {
      name += "${value.name} ";
    }
    return name;
  }

  void add(Person person) {
    persons.add(person);
    notifyListeners();
  }
}
