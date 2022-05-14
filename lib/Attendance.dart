import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'AppConstants.dart';

class Attendance extends StatefulWidget {
  final classUid;
  final date;

  Attendance({required this.classUid, required this.date});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  Map<String, Map<String, dynamic>> currentAttendance = {};
  String selectedDate = '';

  void updateAttendance() {
    var doc = FirebaseFirestore.instance
        .collection(AppConstants.classesCollection)
        .doc(widget.classUid);
    Map<String, Map<String, dynamic>> attendance = {
      selectedDate: currentAttendance
    };
    doc.update({'Attendance': attendance}).then((val) {
      print('Updated');
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentAttendance.isNotEmpty) {
      updateAttendance();
    }
    selectedDate = widget.date.toString();
    selectedDate = selectedDate.split(' ')[0];
    final attendance = getAttendance(widget.classUid, selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: FutureBuilder(
          future: attendance,
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              print(currentAttendance);
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(snapshot.data![index]['rollno'],
                          style: const TextStyle(fontSize: 18)),
                      subtitle:
                          Text(snapshot.data![index]['name'].toUpperCase()),
                      trailing: Checkbox(
                        value: currentAttendance[selectedDate]![
                            snapshot.data![index]['id']],
                        onChanged: (value) {
                          currentAttendance[selectedDate]![snapshot.data![index]
                              ['id']] = value as bool;
                          setState(() {});
                        },
                      ),
                      onTap: () {},
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<List> getAttendance(uid, date) async {
    var ans = [];
    var future = await FirebaseFirestore.instance
        .collection(AppConstants.classesCollection)
        .doc(uid)
        .get();

    var students = future.data()!['Students'];
    var attendance = future.data()!['Attendance'];
    if (attendance.containsKey(date)) {
      currentAttendance[date] = attendance[date];
    } else {
      for (var id in students.keys) {
        currentAttendance[date]![id] = false;
      }
    }

    for (var id in students.keys) {
      var student = await FirebaseFirestore.instance
          .collection(AppConstants.studentsCollection)
          .doc(id)
          .get();

      ans.add({
        'id': id,
        'name': student.data()!['name'],
        'rollno': student.data()!['rollno'],
        'isPresent': currentAttendance[date]![id]
      });
    }
    return ans;
  }
}
