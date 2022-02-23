import 'package:attendence_app/Authentication/Authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Blocs/StudentsBloc.dart';
import '../ClassesFunc/joinClass.dart';

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
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() {
    _getUserDataAsync().then((value) => {_changeState()});
  }

  Future _getUserDataAsync() async {
    await Provider.of<StudentsBloc>(context, listen: false)
        .getStudentInfo(widget.uid);
  }

  void _changeState() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> name = ['Maths', 'Physics', 'Chemistry'];
    var currentStudent = Provider.of<StudentsBloc>(context).currentStudent;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendence App"),
      ),
      body: Container(
        key: GlobalKey(),
        child: Column(
          children: List.generate(
              name.length,
              (index) => Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 6.0, right: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: tileColor,
                        borderRadius: BorderRadius.circular(10),
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
                    ),
                  )),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(currentStudent.name),
              accountEmail: Text(currentStudent.email),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              currentAccountPicture: const CircleAvatar(
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
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const Authenticate();
                }));
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
                  builder: (context) => JoinClass(uid: widget.uid)));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.grey.shade200,
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
