import 'package:attendence_app/joinClass.dart';
import 'package:flutter/material.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  Color tileColor = Colors.white;

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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: const Text("User"),
              accountEmail: const Text("user@gmail.com"),
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
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('log out'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
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
}



/*


 */