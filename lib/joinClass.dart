import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinClass extends StatelessWidget {
  const JoinClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Class"),
      ),
      body: Container(
          child: Column(
        children: const <Widget>[
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'ClassCode',
              hintText: 'Enter ClassCode',
            ),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'RollNo',
                hintText: 'Enter Your Roll Number'),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Name',
                hintText: 'Enter Full Name'),
          ),
        ],
      )),
    );
  }
}
