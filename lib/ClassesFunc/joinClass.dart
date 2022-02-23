import 'package:attendence_app/AppConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JoinClass extends StatefulWidget {
  final uid;
  JoinClass({this.uid});

  @override
  State<JoinClass> createState() => _JoinClassState();
}

class _JoinClassState extends State<JoinClass> {
  @override
  Widget build(BuildContext context) {
    var classCode = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Class"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: const InputDecoration(
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
                onChanged: (val) {
                  classCode = val;
                },
              ),
              const SizedBox(
                height: 22.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  joinClass(widget.uid, classCode);
                },
                onHover: (value) {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Join Class',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future joinClass(String uid, String classCode) async {
  try {
    var future = await FirebaseFirestore.instance
        .collection(AppConstants.classesCollection)
        .doc(classCode)
        .get();
    if (!future.exists) {
      throw 'Invaid Class Code';
    }
    var Students = future['Students'];
    for (int i = 0; i < Students.length; i++) {
      if (Students[i]['StudentId'] == uid) {
        throw Exception("Already Joined");
      }
    }
    FirebaseFirestore dbRef = FirebaseFirestore.instance;

    /* This is pending */
    await dbRef
        .collection(AppConstants.classesCollection)
        .doc(classCode)
        .update({
      'Students': FieldValue.arrayUnion([
        {
          {'StudentId': uid},
          {'Attendance': {}}
        }
      ])
    });

    await dbRef.collection(AppConstants.studentsCollection).doc(uid).update({
      'Classes': FieldValue.arrayUnion([classCode])
    });
    print('Class Joined');
    return 'Class Joined';
  } catch (e) {
    print(e);
    return (e);
  }
}


/* Enter class Code 
Find if a class doesn't exist Show error
else 
Set a new student in teachers class
Set Students total classes equal to subjects total classes
*/