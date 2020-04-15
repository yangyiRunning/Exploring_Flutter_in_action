import 'package:flutter/material.dart';
import 'package:flutter_app/common/CommonShowModel.dart';
import 'package:flutter_app/common/ListViewModel.dart';

class ThemeSwitchManagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arg),
      body: getScrollBar(getThemeList(context)),
    );
  }
}
