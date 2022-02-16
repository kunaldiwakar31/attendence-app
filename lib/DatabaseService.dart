import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final String userType;

  DatabaseService({required this.uid, required this.userType});

  FirebaseFirestore userReference = FirebaseFirestore.instance;

  Future updateUserData(
      String name, String email, String rollno, String userType) async {
    DocumentReference documentReference = userType == 'Student'
        ? userReference.collection('Student').doc(uid)
        : userReference.collection('Teacher').doc(uid);

    return await documentReference.set({
      'name': name,
      'email': email,
      'userType': userType,
      'rollno': rollno,
      'Subjects': []
    });
  }
}
