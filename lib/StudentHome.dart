import 'package:attendence_app/joinClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentHome extends StatefulWidget {
  final uid;
  StudentHome({this.uid});

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  Color tileColor = Colors.white;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    List<String> name = ['Arsh', 'Inder', 'Majnu'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendence App"),
      ),
      body: Container(
        child: Column(
          children: List.generate(
              name.length,
              (index) => Container(
                    decoration: BoxDecoration(
                      color: tileColor,
                      border: const Border(
                        bottom: BorderSide(
                          color: Colors.black38,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        name[index],
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      subtitle: const Text('Teacher Name'),
                      trailing: const Text('70%'),
                    ),
                  )),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('user@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              currentAccountPicture: CircleAvatar(
                radius: 50.0,
                backgroundColor: Color(0xFF778899),
                backgroundImage:
                    NetworkImage("http://tineye.com/images/widgets/mona.jpg"),
              ),
              currentAccountPictureSize: Size.square(72.0),
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
                signout();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const JoinClass()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
