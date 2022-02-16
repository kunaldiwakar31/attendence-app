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
      backgroundColor: const Color.fromARGB(255, 37, 130, 236),
      body: Container(
          child: Column(
        children: const <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Class Code',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(onPressed: null, child: Text("Join Class")),
        ],
      )),
    );
  }
}
