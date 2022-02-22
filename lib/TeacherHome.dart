import 'package:attendence_app/TeachersBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'createClass.dart';

class TeacherHome extends StatefulWidget {
  final uid;
  TeacherHome({this.uid});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
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
        .getSubjectList(widget.uid);
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

    for (String sub in subjects) {
      var split = sub.split(':');
      courses.add(split[0]);
      semesters.add(split[1]);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendence App"),
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
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("User"),
              accountEmail: Text("user@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              currentAccountPicture: CircleAvatar(
                radius: 50.0,
                backgroundColor: const Color(0xFF778899),
                backgroundImage:
                    NetworkImage("http://tineye.com/images/widgets/mona.jpg"),
              ),
              currentAccountPictureSize: const Size.square(72.0),
            ),
            ListTile(
              title: const Text('account'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('log out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateClass(
                        uid: widget.uid,
                      )));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
