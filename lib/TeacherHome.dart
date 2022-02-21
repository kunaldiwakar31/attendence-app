import 'package:flutter/material.dart';

import 'createClass.dart';

<<<<<<< HEAD
class TeacherHome extends StatelessWidget {
  const TeacherHome({Key? key}) : super(key: key);
=======
class TeacherHome extends StatefulWidget {
  final uid;
  TeacherHome({this.uid});

>>>>>>> f0e227c2ce7ab18a01a10c74f7e04d6b6fe16926
  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  @override
  Widget build(BuildContext context) {
    List<String> courses = ['Math', 'English', 'Punjabi'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendence App"),
      ),
      body: Container(
        child: Column(
          children: List.generate(
              courses.length,
              (index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black38,
                        width: 0.5,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        courses[index],
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      subtitle: const Text('Semester'),
                      trailing: const Text('70'),
                    ),
                  )),
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
      backgroundColor: Colors.grey.shade200,
    );
  }
}
