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

    Map<String, dynamic> data = {'uid': uid, 'userType': userType};

    await userReference.collection('User').add(data);

    return await documentReference.set({
      'name': name,
      'email': email,
      'userType': userType,
      'rollno': rollno,
      'Subjects': []
    });
  }

  Future<String> generateCode(
      String subject, String semester, String uid) async {
    var documentSnapshot =
        await userReference.collection('Teacher').doc(uid).get();
    String name = documentSnapshot.data()!['name'];
    Map<String, dynamic> data = {
      'subject': subject,
      'semester': semester,
      'teacher': name
    };
    var documentReference = await userReference.collection('Classes').add(data);
    return documentReference.id;
  }
}
