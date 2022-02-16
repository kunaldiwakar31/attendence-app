// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({Key? key}) : super(key: key);

  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  final _formKey = GlobalKey<FormState>();
  String course_name = "";
  String semester = "1";
  final semesters = ["1", "2", "3", "4", "5", "6", "7", "8"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Class"),
      ),
      backgroundColor: const Color.fromARGB(255, 37, 130, 236),
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
                  validator: (val) =>
                      val!.isEmpty ? 'Enter Course Name !!' : null,
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
                ElevatedButton(
                  onPressed: (() {
                    print(course_name);
                    print(semester);
                  }),
                  child: const Text('create'),
                ),
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

// class CreateClass extends StatelessWidget {
//   const CreateClass({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create Class"),
//       ),
//       backgroundColor: const Color.fromARGB(255, 37, 130, 236),
//       body: Container(
//           child: Column(
//         children: const <Widget>[
//           const SizedBox(
//             height: 20.0,
//           ),
//           TextField(
//             decoration: const InputDecoration(
//               hintText: 'Course Name',
//               fillColor: Colors.white,
//               filled: true,
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0))),
//               focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0))),
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           TextField(
//             decoration: const InputDecoration(
//               hintText: 'Semester Number',
//               fillColor: Colors.white,
//               filled: true,
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0))),
//               focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0))),
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           ElevatedButton(onPressed: null, child: const Text("Create Code")),
//         ],
//       )),
//     );
//   }
// }
