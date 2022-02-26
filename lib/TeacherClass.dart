import 'package:flutter/material.dart';
import 'package:attendence_app/TeacherClassRoutes/StudentList.dart';

class TeacherClass extends StatefulWidget {
  final uid;
  TeacherClass({this.uid});

  @override
  _TeacherClassState createState() => _TeacherClassState();
}

class _TeacherClassState extends State<TeacherClass> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      const Text(
        'Register',
        style: optionStyle,
      ),
      StudentList(uid: widget.uid),
      const Text(
        'Manage',
        style: optionStyle,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Register',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Manage',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
