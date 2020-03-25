import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTextFormWidget extends StatefulWidget{
  @override
  EditTextFormState createState() {
    // TODO: implement createState
    return EditTextFormState();
  }

}

class EditTextFormState extends State<EditTextFormWidget>{
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$arg"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            TextField(

            )
          ],
        ),
      ),
    );
  }

}