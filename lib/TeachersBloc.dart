import 'package:attendence_app/AppConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class TeachersBloc extends ChangeNotifier {
  List _subjectsList = [];

  List get subjectsList {
    assert(_subjectsList != null);
    return _subjectsList;
  }

  final _teachersCollectionReference =
      FirebaseFirestore.instance.collection(AppConstants.teachersCollection);

  Future getSubjectList(String uid) async {
    List subjectsList = [];

    var documentSnapshot = await _teachersCollectionReference.doc(uid).get();
    subjectsList = documentSnapshot.data()!['Subjects'];

    _subjectsList = subjectsList;
    notifyListeners();
  }
}
