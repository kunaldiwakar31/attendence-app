import 'package:flutter/cupertino.dart';

class TeacherClass extends StatefulWidget {
  final uid;
  TeacherClass({this.uid});
  @override
  _TeacherClassState createState() => _TeacherClassState();
}

class _TeacherClassState extends State<TeacherClass> {
  Widget build(BuildContext context) {
    print(widget.uid);
    return Container();
  }
}
