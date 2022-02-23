import 'package:attendence_app/DataStructure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../AppConstants.dart';

class StudentsBloc extends ChangeNotifier {
  Student _currentStudent = Student(
      name: 'name',
      rollno: 'rollno',
      email: 'email',
      subjects: [],
      userType: 'Student');

  Student get currentStudent {
    assert(_currentStudent != null);
    return _currentStudent;
  }

  final _studentsCollectionReference =
      FirebaseFirestore.instance.collection(AppConstants.studentsCollection);

  Future getStudentInfo(String uid) async {
    var documentSnapshot = await _studentsCollectionReference.doc(uid).get();
    var data = documentSnapshot.data();
    _currentStudent = Student(
        name: data!['name'],
        rollno: data['rollno'],
        email: data['email'],
        subjects: data['Subjects'] ?? [],
        userType: data['userType'] ?? 'Student');

    notifyListeners();
  }
}
