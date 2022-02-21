// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'DatabaseService.dart';
import 'package:flutter/services.dart';

class CreateClass extends StatefulWidget {
  final uid;
  CreateClass({this.uid});

  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  final _formKey = GlobalKey<FormState>();
  String course_name = '';
  String semester = '1';
  String name = '';
  final semesters = ["1", "2", "3", "4", "5", "6", "7", "8"];
  String uid = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Class"),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Course Name',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  validator: (val) {
                    val!.isEmpty ? 'Enter Course Name !!' : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      course_name = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      value: semester.toString(),
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: semesters.map(buildMenuItem).toList(),
                      onChanged: (value) => {
                        setState(() {
                          semester = value.toString();
                        })
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (course_name.isNotEmpty) {
                        uid = await DatabaseService(
                                uid: widget.uid, userType: 'Teacher')
                            .generateCode(course_name, semester, widget.uid);
                        if (uid != '') {
                          setState(() {});
                        }
                      }
                    },
                    child: const Text(
                      'Create',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                uid != ''
                    ? uid == 'Class Already Exists'
                        ? const Text('Class Already Exists!!',
                            style: TextStyle(color: Colors.red, fontSize: 14))
                        : Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      uid,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                                ClipboardData(text: uid));
                                          },
                                          icon:
                                              const Icon(Icons.copy, size: 20)))
                                ],
                              ),
                            ),
                          )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
      value: item, child: Text(item, style: const TextStyle(fontSize: 16)));
}
