import 'package:attendence_app/AppConstants.dart';
import 'package:attendence_app/DataStructure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class TeachersBloc extends ChangeNotifier {
  List _subjectsList = [];
  Teacher _currentTeacher =
      Teacher(name: 'Name', email: 'email', userType: 'Teacher');

  List get subjectsList {
    assert(_subjectsList != null);
    return _subjectsList;
  }

  Teacher get currentTeacher {
    assert(_currentTeacher != null);
    return _currentTeacher;
  }

  final _teachersCollectionReference =
      FirebaseFirestore.instance.collection(AppConstants.teachersCollection);

  Future getTeacherInfo(String uid) async {
    var documentSnapshot = await _teachersCollectionReference.doc(uid).get();
    _subjectsList = documentSnapshot.data()!['Subjects'];

    _currentTeacher = Teacher(
        name: documentSnapshot.data()!['name'],
        email: documentSnapshot.data()!['email'],
        userType: documentSnapshot.data()!['userType']);

    notifyListeners();
  }
}
