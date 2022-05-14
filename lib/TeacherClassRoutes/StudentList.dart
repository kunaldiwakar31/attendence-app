import 'package:attendence_app/AppConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  final uid;
  StudentList({this.uid});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: findStudents(widget.uid),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(snapshot.data![index]['rollno'],
                        style: const TextStyle(fontSize: 18)),
                    subtitle: Text(snapshot.data![index]['name'].toUpperCase()),
                    trailing:
                        Text(snapshot.data![index]['attendancePercentage']),
                    onTap: () {},
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

Future<List> findStudents(uid) async {
  var ans = [];
  var future = await FirebaseFirestore.instance
      .collection(AppConstants.classesCollection)
      .doc(uid)
      .get();

  var students = future.data()!['Students'];
  for (var id in students.keys) {
    var student = await FirebaseFirestore.instance
        .collection(AppConstants.studentsCollection)
        .doc(id)
        .get();
    ans.add({
      'name': student.data()!['name'],
      'rollno': student.data()!['rollno'],
      'uid': id,
      'attendancePercentage': students[id].toString()
    });
  }
  return ans;
}
