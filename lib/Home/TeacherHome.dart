import 'package:attendence_app/CommonWidgets/Drawer.dart';
import 'package:attendence_app/TeacherClass.dart';
import 'package:attendence_app/Blocs/TeachersBloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ClassesFunc/createClass.dart';

class TeacherHome extends StatefulWidget {
  final uid;
  TeacherHome({this.uid});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() {
    _getUserDataAsync().then((value) => {_changeState()});
  }

  Future _getUserDataAsync() async {
    await Provider.of<TeachersBloc>(context, listen: false)
        .getTeacherInfo(widget.uid);
  }

  void _changeState() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List subjects = Provider.of<TeachersBloc>(context).subjectsList;
    List<String> courses = [];
    List<String> semesters = [];
    List<String> classUids = [];

    for (String sub in subjects) {
      var split = sub.split(':');
      courses.add(split[0]);
      semesters.add(split[1]);
      classUids.add(split[2]);
    }

    var currentTeacher = Provider.of<TeachersBloc>(context).currentTeacher;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendence App"),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Container(
        child: Column(
          children: List.generate(
            courses.length,
            (index) => ListTile(
              title: Text(
                courses[index],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              subtitle: Text('Semester : ' + semesters[index]),
              trailing: const Text('70'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TeacherClass(classUid: classUids[index])));
              },
            ),
          ),
        ),
      ),
      drawer:
          CustomDrawer(name: currentTeacher.name, email: currentTeacher.email),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateClass(
                        uid: widget.uid,
                      )));
        },
        backgroundColor: Theme.of(context).primaryColorLight,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
