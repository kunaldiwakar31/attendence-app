// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class CreateClass extends StatelessWidget {
  const CreateClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Class"),
      ),
      backgroundColor: const Color.fromARGB(255, 37, 130, 236),
      body: Container(
          child: Column(
        children: const <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Course Name',
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
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Semester Number',
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
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(onPressed: null, child: const Text("Create Code")),
        ],
      )),
    );
  }
}
